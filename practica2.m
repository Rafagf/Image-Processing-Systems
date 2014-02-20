function varargout = practica2(varargin)
% PRACTICA2 M-file for practica2.fig
%      PRACTICA2, by itself, creates a new PRACTICA2 or raises the existing
%      singleton*.
%
%      H = PRACTICA2 returns the handle to a new PRACTICA2 or the handle to
%      the existing singleton*.
%
%      PRACTICA2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA2.M with the given input arguments.
%
%      PRACTICA2('Property','Value',...) creates a new PRACTICA2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before practica2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to practica2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help practica2

% Last Modified by GUIDE v2.5 23-Jan-2013 11:46:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @practica2_OpeningFcn, ...
                   'gui_OutputFcn',  @practica2_OutputFcn, ...
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


% --- Executes just before practica2 is made visible.
function practica2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to practica2 (see VARARGIN)

% Choose default command line output for practica2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes practica2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Para que no aparezca nada en los ejes al comienzo de la ejecucion
axes(handles.axes1)
axis off
axes(handles.axes2)
axis off
axes(handles.axes3)
axis off

%Para manejar el activar y desactivar las barras de colores
handles.boton_barra1=0;
handles.boton_barra2=0;
handles.boton_barra3=0;

%Valores por defecto del panel de ruido
handles.ruido = 1;
set(handles.textoParametro1,'string','a');
set(handles.textoParametro2,'string','b');
set(handles.textoParametro2,'visible','on');
set(handles.campoParametro1,'string','-5');
set(handles.campoParametro2,'string','5');
set(handles.campoParametro2,'visible','on');

%Ponemos loshandles de las imagenes con valor 0
handles.imagen1=0;
handles.imagen2=0;
handles.imagen3=0;

%Escondemos la ventana del metodo gaussiano de filtrado
set(handles.estaticoVentana,'visible','off');

%Valor por defecto del campo Tama�o del panel de filtrado
set(handles.campoTamano,'string','3');

% Choose default command line output for Practica2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = practica2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in boton_cargar1.
function boton_cargar1_Callback(hObject, eventdata, handles)
% hObject    handle to boton_cargar1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_cargar1

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
%[n,m] = size(handles.imagen1);
%resolucion = strcat('[',num2str(n),'x',num2str(m),']');
%set(handles.campoResolucion1,'String', resolucion);

minimo = min(min(handles.imagen1));
maximo = max(max(handles.imagen1));

minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
set(handles.minMaxNiveles1,'String', minmax);

guidata(hObject, handles);


% --- Executes on button press in boton_guardar1.
function boton_guardar1_Callback(hObject, eventdata, handles)
% hObject    handle to boton_guardar1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_guardar1

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


% --- Executes on button press in boton_barra1.
function boton_barra1_Callback(hObject, eventdata, handles)
% hObject    handle to boton_barra1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_barra1

axes(handles.axes1);
if handles.boton_barra1==0
    colorbar;
    handles.boton_barra1=1;
    axis off
elseif handles.boton_barra1==1    
    colorbar('off');
    handles.boton_barra1=0;
    axis off
end
guidata(hObject, handles);

% --- Executes on button press in boton_original1.
function boton_original1_Callback(hObject, eventdata, handles)
% hObject    handle to boton_original1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_original1

imtool(handles.imagen1);


% --- Executes on button press in boton_cargar2.
function boton_cargar2_Callback(hObject, eventdata, handles)
% hObject    handle to boton_cargar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_cargar2

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

% --- Executes on button press in boton_guardar2.
function boton_guardar2_Callback(hObject, eventdata, handles)
% hObject    handle to boton_guardar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_guardar2

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

% --- Executes on button press in boton_barra2.
function boton_barra2_Callback(hObject, eventdata, handles)
% hObject    handle to boton_barra2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_barra2

axes(handles.axes2);
if handles.boton_barra2==0
    colorbar;
    handles.boton_barra2=1;
    axis off
elseif handles.boton_barra2==1    
    colorbar('off');
    handles.boton_barra2=0;
    axis off
end
guidata(hObject, handles);

% --- Executes on button press in boton_original2.
function boton_original2_Callback(hObject, eventdata, handles)
% hObject    handle to boton_original2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_original2

imtool(handles.imagen2);


% --- Executes on button press in boton_cargar3.
function boton_cargar3_Callback(hObject, eventdata, handles)
% hObject    handle to boton_cargar3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_cargar3

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

% --- Executes on button press in boton_guardar3.
function boton_guardar3_Callback(hObject, eventdata, handles)
% hObject    handle to boton_guardar3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_guardar3
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


% --- Executes on button press in boton_barra3.
function boton_barra3_Callback(hObject, eventdata, handles)
% hObject    handle to boton_barra3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_barra3

axes(handles.axes3);
if handles.boton_barra3==0
    colorbar;
    handles.boton_barra3=1;
    axis off
elseif handles.boton_barra3==1    
    colorbar('off');
    handles.boton_barra3=0;
    axis off
end
guidata(hObject, handles);

% --- Executes on button press in boton_original3.
function boton_original3_Callback(hObject, eventdata, handles)
% hObject    handle to boton_original3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of boton_original3

imtool(handles.imagen3);


% --- Executes on button press in boton_aplicar.
function boton_aplicar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_aplicar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.imagen1==0
            errordlg('Una imagen original es necesaria','Error');

%Mejor hacerlo con un switch
            
else if handles.ruido==1 %Ruido distribucion uniforme 
    
    a=str2double(get(handles.campoParametro1,'String'));
    b=str2double(get(handles.campoParametro2,'String'));
 
    matriz_aleatorios=rand(size(handles.imagen1));
    n=a+(b-a).*matriz_aleatorios; %para distribucion U[a,b]
    G = double(handles.imagen1)+n;
    G = uint8(G); %Para que no se salgan los valores de [0,255]

    
    else if handles.ruido==2 %Ruido gaussiano normal

        media=str2double(get(handles.campoParametro1,'String'));
        varianza=str2double(get(handles.campoParametro2,'String'));

        desviacion = sqrt(varianza);
        matriz = randn(size(handles.imagen1));
        matriz = media+(desviacion.*matriz); %para distribucion N[media, varianza]
        G = double(handles.imagen1)+matriz;
        G = uint8(G); %Para que no se salgan los valores de [0,255]



        else if handles.ruido==3 %Ruido gaussiano multiplicativo

            alfa=str2double(get(handles.campoParametro1,'String'));

            n=randn(size(handles.imagen1));
            n=sqrt(double(handles.imagen1)*alfa).*n;
            G=double(handles.imagen1)+n;
            G = uint8(G); %Para que no se salgan los valores de [0,255]

            else if handles.ruido==4 %Ruido Sal y pimienta

                a=str2double(get(handles.campoParametro1,'String'));
                b=str2double(get(handles.campoParametro2,'String'));

                A = 255; %sal
                B = 0; %pimienta
                p = a/100;
                q = b/100;

                G = handles.imagen1;
                valores = rand(size(G));
                L1 = (valores < p);
                L2=(valores > p & valores < p+q);
                G(L1)=A;
                G(L2)=B;
                G = uint8(G); %Ver si haria falta
            
                end
            end
        end
    end

    %Para seleccionar el axis
    axes(handles.axes2);
    handles.imagen2 = G;
    imagesc(handles.imagen2), colormap(gray(256)), axis off
    calcularMSE(hObject, eventdata, handles, 1,2);
    calcularSNR(hObject, eventdata, handles, 1,2);

    %Calculo min-max
    minimo = min(min(handles.imagen2));
    maximo = max(max(handles.imagen2));
    minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
    set(handles.minMaxNiveles2,'String', minmax);
end
guidata(hObject, handles);                
        
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



function campoSNR_Callback(hObject, eventdata, handles)
% hObject    handle to campoSNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoSNR as text
%        str2double(get(hObject,'String')) returns contents of campoSNR as a double


% --- Executes during object creation, after setting all properties.
function campoSNR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoSNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function campoParametro1_Callback(hObject, eventdata, handles)
% hObject    handle to campoParametro1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoParametro1 as text
%        str2double(get(hObject,'String')) returns contents of campoParametro1 as a double

handles.parametro1 = str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function campoParametro1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoParametro1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function campoParametro2_Callback(hObject, eventdata, handles)
% hObject    handle to campoParametro2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoParametro2 as text
%        str2double(get(hObject,'String')) returns contents of campoParametro2 as a double

handles.parametro2 = str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function campoParametro2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoParametro2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in panelRuido.
function panelRuido_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in panelRuido 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

if hObject == handles.botonUniforme
    handles.ruido = 1;
    set(handles.textoParametro1,'string','a');
    set(handles.textoParametro2,'string','b');
    set(handles.textoParametro2,'visible','on');
    set(handles.campoParametro1,'string','-5');
    set(handles.campoParametro2,'string','5');
    set(handles.campoParametro2,'visible','on');
else if hObject == handles.botonGaussAditivo
        handles.ruido = 2;
        set(handles.textoParametro1,'string','Media');
        set(handles.textoParametro2,'string','Varianza');
        set(handles.textoParametro2,'visible','on');
        set(handles.campoParametro1,'string','0.0');
        set(handles.campoParametro2,'string','1.0');
        set(handles.campoParametro2,'visible','on');
    else if hObject == handles.botonGaussMultiplicativo
            handles.ruido = 3;
            set(handles.textoParametro1,'string','Alfa');
            set(handles.textoParametro2,'visible','off');
            set(handles.campoParametro1,'string','0.1');
            set(handles.campoParametro2,'visible','off');
        else if hObject == handles.botonSalPimienta
                handles.ruido = 4;
                set(handles.textoParametro1,'string','% Sal');
                set(handles.textoParametro2,'string','% Pimienta');
                set(handles.textoParametro2,'visible','on');
                set(handles.campoParametro1,'string','5');
                set(handles.campoParametro2,'string','5');
                set(handles.campoParametro2,'visible','on');
            end
        end
    end
end
guidata(hObject, handles);


function calcularMSE(hObject, eventdata, handles, imagen1,imagen2)    
   
%No haria falta ya que siempre ser� la imagen 1 y la 2

if(imagen1 == 1)
    s=handles.imagen1;
else if (imagen1 == 2)
        s=handles.imagen2;
    else if (imagen1 == 3)
            s = handles.imagen3;            
        end
    end
end

if(imagen2 == 1)
    d=handles.imagen1;
else if (imagen2 == 2)
        d=handles.imagen2;
    else if (imagen2 == 3)
            d = handles.imagen3;            
        end
    end
end

sd = double(s);
dd = double(d);
[m,n] = size(s);
mn = m*n;
imagen_diferencia = sd-dd; 
norma=norm(double(imagen_diferencia(:))); 
norma=norma*norma;
errorMedioCuadratico=norma/mn;
set(handles.campoMSE,'String',errorMedioCuadratico);
        
guidata(hObject,handles)

function calcularSNR(hObject, eventdata, handles, imagen1,imagen2)    

%No haria falta ya que siempre ser� la imagen 1 y la 2
if(imagen1 == 1)
    s=handles.imagen1;
else if (imagen1 == 2)
        s=handles.imagen2;
    else if (imagen1 == 3)
            s = handles.imagen3;            
        end
    end
end

if(imagen2 == 1)
    d=handles.imagen1;
else if (imagen2 == 2)
        d=handles.imagen2;
    else if (imagen2 == 3)
            d = handles.imagen3;            
        end
    end
end

media = mean2(s);
imagen = s;
imagen = double(imagen)-double(media);
imagen_norma = norm(double(imagen(:)));
imagen_norma = imagen_norma*imagen_norma;
error = double(s)-double(d); 
error=norm(double(error(:))); 
error=error*error;
SNR = 10*log10(imagen_norma/error);
set(handles.campoSNR,'String',SNR);

guidata(hObject,handles)  

function calcularISNR(hObject, eventdata, handles)    

I=handles.imagen1;
G=handles.imagen2;
Ie=handles.imagen3;
IG=double(I)-double(G);
IGnorma=norm(double(IG(:)));
IGnorma=IGnorma*IGnorma;
IIe=double(I)-double(Ie);
IIeNorma=norm(double(IIe(:)));
IIeNorma=IIeNorma*IIeNorma;
ISNR=10*log10(IGnorma/IIeNorma);
set(handles.campoISNR,'String',ISNR);

guidata(hObject,handles)

% --- Executes on button press in boton_aplicar2.
function boton_aplicar2_Callback(hObject, eventdata, handles)
% hObject    handle to boton_aplicar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.imagen1==0
            errordlg('Una imagen original es necesaria','Error');
    elseif handles.imagen2==0
            errordlg('Una imagen observada es necesaria','Error');
    else
        filtro_seleccionado=get(handles.metodosFiltrado,'Value');
        tamano=str2num(get(handles.campoTamano,'String'));
        imagenRuidosa=handles.imagen2;
        imagenObservada=handles.imagen1;
        imagenFiltrada=0;
        disp(filtro_seleccionado);
        
        switch filtro_seleccionado
            case 1 %PROMEDIO
                
                 if (mod(tamano,2) ==  0) %Factor impar para mascaras con pixel central
                    tamano = tamano+1
                end
                A=fspecial('average',tamano);
                imagenFiltrada=imfilter(imagenRuidosa,A,'circular');
                                
            case 2 %GAUSSIANO
                 
                if (mod(tamano,2) ==  0) %Factor impar para mascaras con pixel central
                    tamano = tamano+1
                end      
                desviacion=tamano;
                A=fspecial('gaussian',13,desviacion);
                imagenFiltrada=imfilter(imagenRuidosa,A,'circular');
                
            case 3 %MEDIANA

                imagenFiltrada=ordfilt2(imagenRuidosa, 5, ones(tamano,tamano));
   
            case 4 %MAXIMO 
                
                imagenFiltrada=ordfilt2(imagenRuidosa, 1, ones(tamano,tamano));        
             
            case 5 %MINIMO
                
                imagenFiltrada=ordfilt2(imagenRuidosa, 9, ones(tamano,tamano));
                
            case 6 %NLM
                sigma=tamano;
                imagenFiltrada=NLmeansfilter(double(imagenRuidosa),5,2,double(sigma));
        end
        
        axes(handles.axes3);
        handles.imagen3 = imagenFiltrada;       
        imagesc(handles.imagen3), colormap(gray(256)), axis off
        calcularISNR(hObject, eventdata, handles);
        
        %Calculo min-max
        minimo = min(min(handles.imagen3));
        maximo = max(max(handles.imagen3));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles3,'String', minmax);   
        set(handles.uipanel3,'Title','Imagen Filtrada');
        
end

guidata(hObject,handles)  

function campoTamano_Callback(hObject, eventdata, handles)
% hObject    handle to campoTamano (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoTamano as text
%        str2double(get(hObject,'String')) returns contents of campoTamano as a double


% --- Executes during object creation, after setting all properties.
function campoTamano_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoTamano (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function campoISNR_Callback(hObject, eventdata, handles)
% hObject    handle to campoISNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoISNR as text
%        str2double(get(hObject,'String')) returns contents of campoISNR as a double


% --- Executes during object creation, after setting all properties.
function campoISNR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoISNR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in metodosFiltrado.
function metodosFiltrado_Callback(hObject, eventdata, handles)
% hObject    handle to metodosFiltrado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 
filtro_seleccionado=get(handles.metodosFiltrado,'Value');
 
if filtro_seleccionado == 2
            
    set(handles.estaticoTamano,'String','Desviacion');
    set(handles.estaticoVentana,'visible','on');   

else if filtro_seleccionado == 6
    
    set(handles.estaticoTamano,'String','Desviacion');
    
    else    
         
    set(handles.estaticoTamano,'String','Tama�o');
    set(handles.estaticoVentana,'visible','off');   
      
    end
end
       
% Hints: contents = cellstr(get(hObject,'String')) returns metodosFiltrado contents as cell array
%        contents{get(hObject,'Value')} returns selected item from metodosFiltrado


% --- Executes during object creation, after setting all properties.
function metodosFiltrado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to metodosFiltrado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uiPanel6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in boton_diferencia.
function boton_diferencia_Callback(hObject, eventdata, handles)
% hObject    handle to boton_diferencia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.imagen1==0
            errordlg('Una imagen original es necesaria','Error');
    elseif handles.imagen2==0
            errordlg('Una imagen observada es necesaria','Error');
    else
        diferencia=handles.imagen1-handles.imagen2;
        handles.imagen3=diferencia;
        axes(handles.axes3)
        imagesc(handles.imagen3), colormap(gray(256)), axis off;
        set(handles.uipanel3,'Title','Original - Observada');
        %Para min-max
        minimo = min(min(handles.imagen3));
        maximo = max(max(handles.imagen3));
        minmax = strcat('[',num2str(minimo),'x',num2str(maximo),']');
        set(handles.minMaxNiveles3,'String', minmax);
 end
guidata(hObject,handles)


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12


% --- Executes during object creation, after setting all properties.
function panelRuido_CreateFcn(hObject, eventdata, handles)
% hObject    handle to panelRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
