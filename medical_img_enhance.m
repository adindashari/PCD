function varargout = medical_img_enhance(varargin)
% MEDICAL_IMG_ENHANCE MATLAB code for medical_img_enhance.fig
%      MEDICAL_IMG_ENHANCE, by itself, creates a new MEDICAL_IMG_ENHANCE or raises the existing
%      singleton*.
%
%      H = MEDICAL_IMG_ENHANCE returns the handle to a new MEDICAL_IMG_ENHANCE or the handle to
%      the existing singleton*.
%
%      MEDICAL_IMG_ENHANCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEDICAL_IMG_ENHANCE.M with the given input arguments.
%
%      MEDICAL_IMG_ENHANCE('Property','Value',...) creates a new MEDICAL_IMG_ENHANCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before medical_img_enhance_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to medical_img_enhance_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help medical_img_enhance

% Last Modified by GUIDE v2.5 28-May-2021 00:01:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @medical_img_enhance_OpeningFcn, ...
                   'gui_OutputFcn',  @medical_img_enhance_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before medical_img_enhance is made visible.
function medical_img_enhance_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to medical_img_enhance (see VARARGIN)

% Choose default command line output for medical_img_enhance
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes medical_img_enhance wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = medical_img_enhance_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file, path_file] = uigetfile({'*.jpg'; '*.png'; '*.jpeg';}, 'Membuka file image');
if ~isequal(nama_file, 0)
    handles.data1 = imread(fullfile(path_file, nama_file));
    guidata(hObject, handles);
    axes(handles.axes1);
    imshow(handles.data1);
else
    return
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Img_gray = handles.Img_gray;
Img_histeq = histeq(Img_gray);
 
axes(handles.axes4)
imshow(Img_histeq)
 
axes(handles.axes5)
imhist(Img_histeq)
grid on




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a = handles.data1;
axes(handles.axes1);
imshow(a);

h = imrect;
position = wait (h);
hasil1 = imcrop(a, position);
handles.hasil1 = hasil1;
axes(handles.axes2)
imshow(hasil1);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = (handles.data1);
Tx = 20;
Ty = 50;
[bar kol] = size(b);
for x = 1:bar;
    for y = 1:kol;
        B(x+Tx,y+Ty) = b(x,y);
    end
end
hsl = B(1:bar, 1:kol);
axes(handles.axes2);
imshow(hsl);


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file_save, path_save] = uiputfile(...
    {'*.jpg','File (*.jpg)';
    '*.png', 'File (*.png)'},...
    'Menyimpan file image');
imwrite(handles.hasil, fullfile(path_save, nama_file_save), 'BMP');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
vid = videoinput('winvideo');
vidRes = get(vid, 'VideoResolution');
imWidth = vidRes(1);
imHeight = vidRes(2);
nBands = get(vid, 'NumberOfBands');
hImage = image(zeros(imHeight, imWidth, nBands));
preview(vid, hImage);
guidata(hObject, handles);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
vid = videoinput('winvideo', 1);
set(vid, 'ReturnedColorSpace', 'RGB');
image = getsnapshot(vid);
imshow(image);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c = handles.data1;
Img_gray = rgb2gray(c);
axes(handles.axes2)
imshow(Img_gray)
 
axes(handles.axes3)
imhist(Img_gray)
title('Histogram')
grid on
 
handles.Img_gray = Img_gray;
guidata(hObject, handles)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Img_gray = handles.Img_gray;



% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Img_gray = handles.Img_gray;
Img_adapthisteq = adapthisteq(Img_gray);

axes(handles.axes6)
imshow(Img_adapthisteq)
 
axes(handles.axes7)
imhist(Img_adapthisteq)
grid on
