function varargout = Practica1(varargin)
% PRACTICA1 M-file for Practica1.fig
%      PRACTICA1, by itself, creates a new PRACTICA1 or raises the existing
%      singleton*.
%
%      H = PRACTICA1 returns the handle to a new PRACTICA1 or the handle to
%      the existing singleton*.
%
%      PRACTICA1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA1.M with the given input arguments.
%
%      PRACTICA1('Property','Value',...) creates a new PRACTICA1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Practica1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Practica1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Practica1

% Last Modified by GUIDE v2.5 11-Nov-2012 13:37:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Practica1_OpeningFcn, ...
                   'gui_OutputFcn',  @Practica1_OutputFcn, ...
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


% --- Executes just before Practica1 is made visible.
function Practica1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Practica1 (see VARARGIN)

%Para quitar los ejes de las 3 imagenes desde el principio
axes(handles.axes1)
axis off
axes(handles.axes2)
axis off
axes(handles.axes3)
axis off

%Para manejar el activar y desactivar las barras de colores
handles.barra_color1=0;
handles.barra_color2=0;
handles.barra_color3=0;

%Establecemos valor máximo (255) para el del nivel del color
v=get(handles.slider_nivel_color,'Max')
set(handles.slider_nivel_color,'Value',v)

%Tambien para el campo estatico

set(handles.campo_nivel_color,'String',v);

set(handles.slider_nivel_color,'String','gray');

%Para establecer los valores por defecto de los radio button

set(handles.radiobotonOrigen1,'Value',1);
set(handles.radiobotonDestino2,'Value',1);
set(handles.radiobotonSubmuestreo,'Value',1);

%Para establecer como desactivado el campo promedio

handles.promedio = 0;

%Creamos variables para el control del metodo de interpolacion
%handles.metodoInterpolacion=1;

% Choose default command line output for Practica1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Practica1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Practica1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cargarBoton1.
function cargarBoton1_Callback(hObject, eventdata, handles)
% hObject    handle to cargarBoton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = fullfile(imgetfile);
handles.imagen1 = imread(f);

%Por si usasemos una imagen que no este en la escala de grises
if ndims(handles.imagen1)==3
handles.imagen1 = rgb2gray(handles.imagen1)
end

%Para seleccionar el axis
axes(handles.axes1);
imagesc(handles.imagen1), colormap(gray(256)), axis off

%Para mostrar la resolucion
[n,m] = size(handles.imagen1);
resolucion = strcat('[',num2str(n),'x',num2str(m),']');
set(handles.campoResolucion1,'String', resolucion);

minimo = min(min(handles.imagen1));
maximo = max(max(handles.imagen1));

minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
set(handles.minMaxNiveles1,'String', minmax);

guidata(hObject, handles);
%Como puedo hacer que el dialogo muestre un mensaje personaliazado? 'Abrir
%Imagen por ejemplo'


% --- Executes on button press in guardarBoton1.
function guardarBoton1_Callback(hObject, eventdata, handles)
% hObject    handle to guardarBoton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Obtener imagen del axes
rgb = getimage(handles.axes1);
if isempty(rgb), return, end
% Guardar archivo
formatos = {'*.jpg','JPEG (*.jpg)';'*.tif','TIFF (*.tif)'};
[nomb,ruta] = uiputfile(formatos,'Guardar imagen');
if nomb==0, return, end
fName = fullfile(ruta,nomb);
imwrite(rgb,fName);
guidata(hObject,handles);


% --- Executes on button press in cargarBoton2.
function cargarBoton2_Callback(hObject, eventdata, handles)
% hObject    handle to cargarBoton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = fullfile(imgetfile);
handles.imagen2 = imread(f);

%Por si usasemos una imagen que no este en la escala de grises
if ndims(handles.imagen2)==3
handles.imagen2 = rgb2gray(handles.imagen2)
end
%Para seleccionar el axis
axes(handles.axes2);
imagesc(handles.imagen2), colormap(gray(256)), axis off
guidata(hObject, handles);

%Para mostrar la resolucion
[n,m] = size(handles.imagen2);
resolucion = strcat('[',num2str(n),'x',num2str(m),']');
set(handles.campoResolucion2,'String', resolucion);

minimo = min(min(handles.imagen2));
maximo = max(max(handles.imagen2));

minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
set(handles.minMaxNiveles2,'String', minmax);

% --- Executes on button press in guardarBoton2.
function guardarBoton2_Callback(hObject, eventdata, handles)
% hObject    handle to guardarBoton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Obtener imagen del axes
rgb = getimage(handles.axes2);
if isempty(rgb), return, end
% Guardar archivo
formatos = {'*.jpg','JPEG (*.jpg)';'*.tif','TIFF (*.tif)'};
[nomb,ruta] = uiputfile(formatos,'Guardar imagen');
if nomb==0, return, end
fName = fullfile(ruta,nomb);
imwrite(rgb,fName);
guidata(hObject, handles);

% --- Executes on button press in cargarBoton3.
function cargarBoton3_Callback(hObject, eventdata, handles)
% hObject    handle to cargarBoton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = fullfile(imgetfile);
handles.imagen3 = imread(f);

%Por si usasemos una imagen que no este en la escala de grises
if ndims(handles.imagen3)==3
handles.imagen3 = rgb2gray(handles.imagen3)
end
%Para seleccionar el axis
axes(handles.axes3);
imagesc(handles.imagen3), colormap(gray(256)), axis off
guidata(hObject, handles);

%Para mostrar la resolucion
[n,m] = size(handles.imagen3);
resolucion = strcat('[',num2str(n),'x',num2str(m),']');
set(handles.campoResolucion3,'String', resolucion);

minimo = min(min(handles.imagen3));
maximo = max(max(handles.imagen3));

minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
set(handles.minMaxNiveles3,'String', minmax);

% --- Executes on button press in guardarBoton3.
function guardarBoton3_Callback(hObject, eventdata, handles)
% hObject    handle to guardarBoton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Obtener imagen del axes
rgb = getimage(handles.axes3);
if isempty(rgb), return, end
% Guardar archivo
formatos = {'*.jpg','JPEG (*.jpg)';'*.tif','TIFF (*.tif)'};
[nomb,ruta] = uiputfile(formatos,'Guardar imagen');
if nomb==0, return, end
fName = fullfile(ruta,nomb);
imwrite(rgb,fName);
guidata(hObject, handles);


% --- Executes on button press in radiobotonOrigen1.
function radiobotonOrigen1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonOrigen1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonOrigen1

%Para el toggeling de los botones. Desactivamos los otros 2
set(hObject,'Value', 1);
set(handles.radiobotonOrigen2,'Value',0);
set(handles.radiobotonOrigen3,'Value',0);


% --- Executes on button press in radiobotonOrigen3.
function radiobotonOrigen3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonOrigen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonOrigen3

%Para el toggeling de los botones. Desactivamos los otros 2
set(hObject,'Value', 1);
set(handles.radiobotonOrigen1,'Value',0);
set(handles.radiobotonOrigen2,'Value',0);


% --- Executes on button press in radiobotonOrigen2.
function radiobotonOrigen2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonOrigen2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonOrigen2

%Para el toggeling de los botones. Desactivamos los otros 2
set(hObject,'Value', 1);
set(handles.radiobotonOrigen1,'Value',0);
set(handles.radiobotonOrigen3,'Value',0);

% --- Executes on button press in Menu_color.
function Menu_color_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Menu_color_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Menu_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu_color.
function menu_color_Callback(hObject, eventdata, handles)
% hObject    handle to menu_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_color contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_color

% handles    structure with handles and user data (see GUIDATA)
valor = get(hObject, 'VALUE');
cadena = get(hObject, 'STRING');
disp('Contenido de cadena en menu_color')
disp(cadena);
colormap(char(cadena{valor}));
handles.cadena = cadena;
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function menu_color_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in barra_color1.
function barra_color1_Callback(hObject, eventdata, handles)
% hObject    handle to barra_color1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
if handles.barra_color1==0
    colorbar;
    handles.barra_color1=1;
    axis off
elseif handles.barra_color1==1    
    colorbar('off');
    handles.barra_color1=0;
    axis off
end
guidata(hObject, handles);
% --- Executes on button press in barra_color2.
function barra_color2_Callback(hObject, eventdata, handles)
% hObject    handle to barra_color2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
if handles.barra_color2==0
    colorbar;
    handles.barra_color2=1;
    axis off
elseif handles.barra_color2==1    
    colorbar('off');
    handles.barra_color2=0;
    axis off
end
guidata(hObject, handles);


% --- Executes on button press in barra_color3.
function barra_color3_Callback(hObject, eventdata, handles)
% hObject    handle to barra_color3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);
if handles.barra_color3==0
    colorbar;
    handles.barra_color3=1;
    axis off
elseif handles.barra_color3==1    
    colorbar('off');
    handles.barra_color3=0;
    axis off
end
guidata(hObject, handles);


% --- Executes on button press in boton_original1.
function boton_original1_Callback(hObject, eventdata, handles)
% hObject    handle to boton_original1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imtool(handles.imagen1);


% --- Executes on button press in boton_original2.
function boton_original2_Callback(hObject, eventdata, handles)
% hObject    handle to boton_original2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imtool(handles.imagen2);

% --- Executes on button press in boton_original3.
function boton_original3_Callback(hObject, eventdata, handles)
% hObject    handle to boton_original3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imtool(handles.imagen3);


% --- Executes on slider movement.
function slider_nivel_color_Callback(hObject, eventdata, handles)
% hObject    handle to slider_nivel_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%Cogemos el valor del slider
valor = fix(get(hObject,'Value'));
valor_string = num2str(valor);
disp('Contenido de valor es: ');
disp(valor);
%Rellenamos el campo estatico. Fix es para quedarse con valores enteros
set(handles.campo_nivel_color,'String',valor);
disp('Contenido de valor despues del set: ');
disp(valor);
aux = get(handles.menu_color,'String');
aux2 = get(handles.menu_color,'Value');
nombre=aux{aux2};
colorm = strcat(nombre,'(',valor_string,')');
disp('Contenido de colorm es: ');
disp(colorm);
colormap(colorm);
disp('Contenido de valor al final: ');
disp(valor);
guidata(hObject, handles);

%cadena=get(handles.menu_color,'String');
%disp('Contenido de cadena es: ');
%disp(cadena);
%colormap(cool(valor));

% --- Executes during object creation, after setting all properties.
function slider_nivel_color_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_nivel_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function campo_nivel_color_Callback(hObject, eventdata, handles)
% hObject    handle to campo_nivel_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campo_nivel_color as text
%        str2double(get(hObject,'String')) returns contents of campo_nivel_color as a double

v =  str2double(get(hObject,'String'));
set(handles.slider_nivel_color,'Value',v);

valor = v;
valor_string = num2str(valor);
disp('Contenido de valor es: ');
disp(valor);
%Rellenamos el campo estatico. Fix es para quedarse con valores enteros
set(handles.campo_nivel_color,'String',valor);
disp('Contenido de valor despues del set: ');
disp(valor);
aux = get(handles.menu_color,'String');
aux2 = get(handles.menu_color,'Value');
nombre=aux{aux2};
colorm = strcat(nombre,'(',valor_string,')');
disp('Contenido de colorm es: ');
disp(colorm);
colormap(colorm);
disp('Contenido de valor al final: ');
disp(valor);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function campo_nivel_color_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campo_nivel_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobotonSubmuestreo.
function radiobotonSubmuestreo_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonSubmuestreo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonSubmuestreo

%Para el toggeling de los botones. Desactivamos los otros 2
set(hObject,'Value', 1);
set(handles.radiobotonInterpolacion1,'Value',0);
set(handles.radiobotonInterpolacion2,'Value',0);

% --- Executes on button press in radiobotonInterpolacion2.
function radiobotonInterpolacion2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonInterpolacion2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonInterpolacion2

%Para el toggeling de los botones. Desactivamos los otros 2
set(hObject,'Value', 1);
set(handles.radiobotonInterpolacion1,'Value',0);
set(handles.radiobotonSubmuestreo,'Value',0);

% --- Executes on button press in radiobotonInterpolacion1.
function radiobotonInterpolacion1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonInterpolacion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonInterpolacion1

%Para el toggeling de los botones. Desactivamos los otros 2
set(hObject,'Value', 1);
set(handles.radiobotonInterpolacion2,'Value',0);
set(handles.radiobotonSubmuestreo,'Value',0);
%set(handles.checkboxPromedio ,'Visible','off');


function campoFactor_Callback(hObject, eventdata, handles)
% hObject    handle to campoFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoFactor as text
%        str2double(get(hObject,'String')) returns contents of campoFactor as a double

handles.factor = str2double(get(hObject,'String'));
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function campoFactor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoFactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkBoxPromedio.
function checkBoxPromedio_Callback(hObject, eventdata, handles)
% hObject    handle to checkBoxPromedio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkBoxPromedio

handles.promedio=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on button press in radiobotonDestino3.
function radiobotonDestino3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonDestino3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonDestino3

%Para el toggeling de los botones. Desactivamos los otros 2
set(hObject,'Value', 1);
set(handles.radiobotonDestino1,'Value',0);
set(handles.radiobotonDestino2,'Value',0);

% --- Executes on button press in radiobotonDestino2.
function radiobotonDestino2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonDestino2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonDestino2

%Para el toggeling de los botones. Desactivamos los otros 2
set(hObject,'Value', 1);
set(handles.radiobotonDestino1,'Value',0);
set(handles.radiobotonDestino3,'Value',0);

% --- Executes on button press in radiobotonDestino1.
function radiobotonDestino1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonDestino1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Para el toggeling de los botones. Desactivamos los otros 2
set(hObject,'Value', 1);
set(handles.radiobotonDestino2,'Value',0);
set(handles.radiobotonDestino3,'Value',0);

% Hint: get(hObject,'Value') returns toggle state of radiobotonDestino1


% --- Executes on button press in botonAplicar.
function botonAplicar_Callback(hObject, eventdata, handles)
% hObject    handle to botonAplicar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of botonAplicar

valorOrigen1 = get(handles.radiobotonOrigen1,'Value');
valorOrigen2 = get(handles.radiobotonOrigen2,'Value');
valorOrigen3 = get(handles.radiobotonOrigen3,'Value');

valorDestino1 = get(handles.radiobotonDestino1,'Value');
valorDestino2 = get(handles.radiobotonDestino2,'Value');
valorDestino3 = get(handles.radiobotonDestino3,'Value');

if valorOrigen1 == 1
    f = handles.imagen1;
elseif valorOrigen2 == 1
    f = handles.imagen2;
elseif valorOrigen3 == 1
    f = handles.imagen3;
end

bool_submuestreo = get(handles.radiobotonSubmuestreo,'Value');
promedio = handles.promedio;
bool_interpolacionFactor = get(handles.radiobotonInterpolacion1,'Value');
bool_interpolacionTam = get(handles.radiobotonInterpolacion2,'Value');

if ((bool_submuestreo == 1) && (promedio==0))
    factor = handles.factor;
    
    [n,m]=size(f);
    %h=fspecial('average',3);
    %u=imfilter(f,h,'circular','same','conv');
    um=f(2:factor:n,2:factor:m);
    
    if valorDestino1 == 1
        axes(handles.axes1);
        handles.imagen1=um; %Para guardar la nueva estructura
        imagesc(um);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen1);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion1,'String', resolucion);
        minimo = min(min(handles.imagen1));
        maximo = max(max(handles.imagen1));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles1,'String', minmax);
        axis off
        
    elseif valorDestino2 == 1
        axes(handles.axes2);
        handles.imagen2=um; %Para guardar la nueva estructura
        imagesc(um);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen2);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion2,'String', resolucion);
        minimo = min(min(handles.imagen2));
        maximo = max(max(handles.imagen2));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles2,'String', minmax);
        axis off
        
    elseif valorDestino3 == 1
        axes(handles.axes3);
        handles.imagen3=um; %Para guardar la nueva estructura
        imagesc(um);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen3);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion3,'String', resolucion);
        minimo = min(min(handles.imagen3));
        maximo = max(max(handles.imagen3));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles3,'String', minmax);
        axis off
    end
        
elseif ((bool_submuestreo == 1) && (promedio==1))
    
    factor = handles.factor;    
    if (mod(factor,2) ==  0) %Factor impar para mascaras con pixel central
        factor = factor+1;
    end
    
    [n,m]=size(f);
    
    h=fspecial('average',factor);
    u=imfilter(f,h,'circular','same','conv');
    um=u(2:handles.factor:n,2:handles.factor:m);
    
    if valorDestino1 == 1
        axes(handles.axes1);
        handles.imagen1=um; %Para guardar la nueva estructura
        imagesc(um);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen1);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion1,'String', resolucion);
        minimo = min(min(handles.imagen1));
        maximo = max(max(handles.imagen1));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles1,'String', minmax);
        axis off
    elseif valorDestino2 == 1
        axes(handles.axes2);
        handles.imagen2=um; %Para guardar la nueva estructura
        imagesc(um);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen2);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion2,'String', resolucion);
        minimo = min(min(handles.imagen2));
        maximo = max(max(handles.imagen2));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles2,'String', minmax);
        axis off
    elseif valorDestino3 == 1
        axes(handles.axes3);
        handles.imagen3=um; %Para guardar la nueva estructura
        imagesc(um);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen3);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion3,'String', resolucion);
        minimo = min(min(handles.imagen3));
        maximo = max(max(handles.imagen3));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles3,'String', minmax);
        axis off
    end
    
elseif bool_interpolacionFactor==1
    
    cadena = get(handles.menuMetodoInterpolacion, 'String');
    valor = get(handles.menuMetodoInterpolacion, 'Value');
    aux = cadena{valor};
    disp('Interpolacion escogida es: ');
    disp(aux);
 
    if strcmp(aux, 'Interpolacion bilinear')==1
        metodo = 'bilinear';
    elseif strcmp(aux,'Vecino mas proximo')==1
        metodo = 'nearest';
    elseif strcmp(aux,'Interpolacion bicubica')==1
        metodo = 'bicubic';
    end;
    
    factor = handles.factor;    
    %if (mod(factor,2) ==  0) %Factor impar para mascaras con pixel central
    %    factor = factor+1;
    %end
    
    %f=handles.imagen1;
    imagen_interpolada=imresize(f,factor,metodo);
    
    if valorDestino1 == 1
        axes(handles.axes1);
        handles.imagen1=imagen_interpolada; %Para guardar la nueva estructura
        imagesc(imagen_interpolada);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen1);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion1,'String', resolucion);
        minimo = min(min(handles.imagen1));
        maximo = max(max(handles.imagen1));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles1,'String', minmax);
        axis off
    elseif valorDestino2 == 1
        axes(handles.axes2);
        handles.imagen2=imagen_interpolada; %Para guardar la nueva estructura
        imagesc(imagen_interpolada);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen2);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion2,'String', resolucion);
        minimo = min(min(handles.imagen2));
        maximo = max(max(handles.imagen2));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles2,'String', minmax);
        axis off
    elseif valorDestino3 == 1
        axes(handles.axes3);
        handles.imagen3=imagen_interpolada; %Para guardar la nueva estructura
        imagesc(imagen_interpolada);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen3);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion3,'String', resolucion);
        minimo = min(min(handles.imagen3));
        maximo = max(max(handles.imagen3));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles3,'String', minmax);
        axis off
    end
    
elseif bool_interpolacionTam == 1
    
    cadena = get(handles.menuMetodoInterpolacion, 'String');
    valor = get(handles.menuMetodoInterpolacion, 'Value');
    aux = cadena{valor};
 
    if strcmp(aux, 'Interpolacion bilinear')==1
        metodo = 'bilinear';
    elseif strcmp(aux,'Vecino mas proximo')==1
        metodo = 'nearest';
    elseif strcmp(aux,'Interpolacion bicubica')==1
        metodo = 'bicubic';
    end;
     
    filas=str2num(get(handles.campoInterFilas,'string'));
    columnas=str2num(get(handles.campoInterColumnas,'string'));
    imagen_interpolada=imresize(f,[filas columnas],metodo);
        
    if valorDestino1 == 1
        axes(handles.axes1);
        handles.imagen1=imagen_interpolada; %Para guardar la nueva estructura
        imagesc(imagen_interpolada);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen1);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion1,'String', resolucion);
        minimo = min(min(handles.imagen1));
        maximo = max(max(handles.imagen1));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles1,'String', minmax);
        axis off
    elseif valorDestino2 == 1
        axes(handles.axes2);
        handles.imagen2=imagen_interpolada; %Para guardar la nueva estructura
        imagesc(imagen_interpolada);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen2);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion2,'String', resolucion);
        minimo = min(min(handles.imagen2));
        maximo = max(max(handles.imagen2));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles2,'String', minmax);
        axis off
    elseif valorDestino3 == 1
        axes(handles.axes3);
        handles.imagen3=imagen_interpolada; %Para guardar la nueva estructura
        imagesc(imagen_interpolada);
        %Para mostrar la resolucion
        [n,m] = size(handles.imagen3);
        resolucion = strcat('[',num2str(n),'x',num2str(m),']');
        set(handles.campoResolucion3,'String', resolucion);
        minimo = min(min(handles.imagen3));
        maximo = max(max(handles.imagen3));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles3,'String', minmax);
        axis off
    end
end;

guidata(hObject,handles);
% --- Executes on selection change in menuMetodoInterpolacion.
function menuMetodoInterpolacion_Callback(hObject, eventdata, handles)
% hObject    handle to menuMetodoInterpolacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menuMetodoInterpolacion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menuMetodoInterpolacion


% --- Executes during object creation, after setting all properties.
function menuMetodoInterpolacion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menuMetodoInterpolacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function campoInterFilas_Callback(hObject, eventdata, handles)
% hObject    handle to campoInterFilas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoInterFilas as text
%        str2double(get(hObject,'String')) returns contents of campoInterFilas as a double


% --- Executes during object creation, after setting all properties.
function campoInterFilas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoInterFilas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function campoInterColumnas_Callback(hObject, eventdata, handles)
% hObject    handle to campoInterColumnas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoInterColumnas as text
%        str2double(get(hObject,'String')) returns contents of campoInterColumnas as a double


% --- Executes during object creation, after setting all properties.
function campoInterColumnas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoInterColumnas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function campoResolucion1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoResolucion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in botonDiferencia.
function botonDiferencia_Callback(hObject, eventdata, handles)
% hObject    handle to botonDiferencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    valorOrigen1 = get(handles.radiobotonOrigen1,'Value');
    valorOrigen2 = get(handles.radiobotonOrigen2,'Value');
    valorOrigen3 = get(handles.radiobotonOrigen3,'Value');

    valorDestino1 = get(handles.radiobotonDestino1,'Value');
    valorDestino2 = get(handles.radiobotonDestino2,'Value');
    valorDestino3 = get(handles.radiobotonDestino3,'Value');

    if valorOrigen1 == 1
        im_origen = handles.imagen1;
    elseif valorOrigen2 == 1
        im_origen = handles.imagen2;
    elseif valorOrigen3 == 1
        im_origen = handles.imagen3;
    end

    if valorDestino1 == 1
        im_destino = handles.imagen1;
    elseif valorDestino2 == 1
        im_destino = handles.imagen2;
    elseif valorDestino3 == 1
        im_destino = handles.imagen3;
    end
    
    [m,n] = size(im_origen);
    [x,y] = size(im_destino);
    
    if ((m==x) && (n==y))
    
        imtool(im_origen-im_destino),colormap(gray(255)),colorbar;
    else
   
        errordlg('Las imagenes tienen distintas dimensiones',...
'Error','modal');
    end
% --- Executes on button press in botonMSE.
function botonMSE_Callback(hObject, eventdata, handles)
% hObject    handle to botonMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


    valorOrigen1 = get(handles.radiobotonOrigen1,'Value');
    valorOrigen2 = get(handles.radiobotonOrigen2,'Value');
    valorOrigen3 = get(handles.radiobotonOrigen3,'Value');

    valorDestino1 = get(handles.radiobotonDestino1,'Value');
    valorDestino2 = get(handles.radiobotonDestino2,'Value');
    valorDestino3 = get(handles.radiobotonDestino3,'Value');

    if valorOrigen1 == 1
        s = handles.imagen1;
    elseif valorOrigen2 == 1
        s = handles.imagen2;
    elseif valorOrigen3 == 1
        s = handles.imagen3;
    end

    if valorDestino1 == 1
        d = handles.imagen1;
    elseif valorDestino2 == 1
        d = handles.imagen2;
    elseif valorDestino3 == 1
        d = handles.imagen3;
    end    
    
    [m,n] = size(s);
    [x,y] = size(d);

    
    if ((m==x) && (n==y))
        disp('A es ');
        disp(d);
        mn = n*n;
        disp('mn es ');
        disp(mn);
        A = s-d;
        disp('A es ');
        disp(A);
        A = A.*A;
        disp('A al cuadrado es ');
        disp(A);
        suma=sum(A(:));
        disp('La suma es ');
        disp(suma);
        mse = (1/mn)*suma;
        disp('mse final es ');
        disp(mse);
        set(handles.campoMSE,'String',mse);
        
    else
                
        errordlg('Las imagenes tienen distintas dimensiones',...
'Error','modal');
        
    end
    


function campoMSE_Callback(hObject, eventdata, handles)
% hObject    handle to campoMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoMSE as text
%        str2double(get(hObject,'String')) returns contents of campoMSE as a double


% --- Executes during object creation, after setting all properties.
function campoMSE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoMSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
