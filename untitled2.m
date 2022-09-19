function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 27-Dec-2021 07:22:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
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


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, handles)
x=get(handles.edit1,'string');
imshow(x, 'Parent', handles.axes1);
y=imread(x);
q=negativeimage(y);
imshow(q, 'Parent', handles.axes2);
powertransaction(y);
% hObject    handle to pushbutton1 (see GCBO)

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(~, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(~, ~, handles)

%x1=get(handles.popupmenu2,'value');
image=handles.image;
% switch x1
% 
%     case 1
%         x='pout.tif';
%     case 2
%         x='peppers.png'; 
%     
%     case 3
%         x='cameraman.tif';
%     case 4
%         x='low.tif';            
% end

h=get(handles.popupmenu1,'value');

%Negative Image
%power transaction 
%root transaction
%log transaction
%inverse log

% axes(handles.axes1);
% imshow(image);


switch h

    case 1
       % imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=rgbtogray(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
    case 2
       % imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        imhist(y);
        q=graytobinary(y);
        axes(handles.axes4);
        imhist(q);
        imshow(q, 'Parent', handles.axes2);
    case 3
       % imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=rgbtobinary(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
    case 4
       % imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=hist_stret(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
    case 5
       % imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=HistEq(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);    
    
    case 6
       % imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=negativeimage(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
    case 7
        %imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=powertransaction(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
    case 8
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=roottransaction(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
    case 9
       % imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=logtransaction(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
    case 10
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=lntransaction(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
    case 11
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        filter = ones(3, 3)/9;
        q=Correlation(y,filter);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        
        case 12
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=MeanFilter(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 13
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=WeightFilter(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 14
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=pointdetection_RGP(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 15
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=pointdetection_Gray(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 16
      %  imshow(x, 'Parent', handles.axes1);
      set(handles.edit2, 'enable', 'on');
      set(handles.edit3, 'enable', 'on');
      t=str2num(get(handles.edit2,'string'));
      u=str2num(get(handles.edit3,'string'));
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=linedetection(y,t,u);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 17
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=pointdetection_sharp_RGP(y);
        axes(handles.axes4);
        histogram(q);
        case 18
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=pointdetection_sharp_Gray(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 19
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=MinFilter(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 20
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=MaxFilter(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 21
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=MedianFilter(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 22
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=MidpointFilter(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 23
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=ideallowpass(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 24
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=idealhighpass(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 25
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=butterworthlowpass(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 26
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=butterworthhighpass(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 27
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=gaussianlowpass(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 28
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=gaussianhighpass(y);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 29
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=saltandpepper(y,.3,.4);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 30
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=noise_gussian(y,.3,.4);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 31
            
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=rayleighnoise(y,.3,.4);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        case 32
      %  imshow(x, 'Parent', handles.axes1);
        y=imread(image);
        axes(handles.axes3);
        histogram(y);
        q=noise_uniform(y,.3,.4);
        axes(handles.axes4);
        histogram(q);
        imshow(q, 'Parent', handles.axes2);
        
end

% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, ~, ~)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

[filename,pathname]=uigetfile({'*.jpg';'*.tif';'*.bmp';'*.png'},'File Selector');
image=strcat(pathname,filename);
handles.image=image;
guidata(hObject,handles);
% x1=get(handles.popupmenu2,'value');

% switch x1
% 
%     case 1
%         x='pout.tif';
%     case 2
%         x='peppers.png'; 
%     
%     case 3
%         x='cameraman.tif';
%     case 4
%         x='low.tif';            
% end
axes(handles.axes1);
imshow(image);
 %imshow(image , handles.axes1);
        

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
clear
clc
cla
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
