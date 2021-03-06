function varargout = p3(varargin)
% P3 M-file for p3.fig
%      P3, by itself, creates a new P3 or raises the existing
%      singleton*.
%
%      H = P3 returns the handle to a new P3 or the handle to
%      the existing singleton*.
%
%      P3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in P3.M with the given input arguments.
%
%      P3('Property','Value',...) creates a new P3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before p3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to p3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help p3

% Last Modified by GUIDE v2.5 26-Jan-2013 00:21:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @p3_OpeningFcn, ...
                   'gui_OutputFcn',  @p3_OutputFcn, ...
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


% --- Executes just before p3 is made visible.
function p3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to p3 (see VARARGIN)

% Choose default command line output for p3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes p3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Para que no aparezca nada en los ejes al comienzo de la ejecucion
axes(handles.axes1)
axis off
axes(handles.axes2)
axis off

%Ponemos loshandles de las imagenes con valor 0
handles.imagen1=0;
handles.imagen2=0;

%Valores por defecto
set(handles.botonFronteras,'value',1);
set(handles.checkboxEstrechar,'Value', 1);
set(handles.checkboxUmbral,'Value', 1);
set(handles.radiobotonPromedio,'enable', 'off');
set(handles.radiobotonGaussiano,'enable', 'off');
set(handles.campoTamano,'enable', 'off');
set(handles.radiobotonDireccion45,'Enable','off');
set(handles.radiobotonDireccion135,'Enable','off')
set(handles.campoUmbralSuperior,'Enable','off')
set(handles.campoUmbralInferior,'Enable','off')
set(handles.campoSigma,'Enable','off')
set(handles.checkboxUmbral2,'Enable','off')
set(handles.checkboxUmbral2,'Value',0);
handles.color = 'ks';
set(handles.uipanel14,'Visible','off');
set(handles.uipanel15,'Visible','off');

% Choose default command line output for Practica2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = p3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in botonCargar.
function botonCargar_Callback(hObject, eventdata, handles)
% hObject    handle to botonCargar (see GCBO)
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

guidata(hObject, handles);


% --- Executes on button press in botonGuardar.
function botonGuardar_Callback(hObject, eventdata, handles)
% hObject    handle to botonGuardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in botonAmpliar.
function botonAmpliar_Callback(hObject, eventdata, handles)
% hObject    handle to botonAmpliar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

figure,imshow(handles.imagen2);
guidata(hObject, handles);


% --- Executes on button press in radiobotonFrontera.
function radiobotonFrontera_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonFrontera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonFrontera


% --- Executes on button press in radiobotonGrad45.
function radiobotonGrad45_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonGrad45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonGrad45


% --- Executes on button press in radiobotonGrad135.
function radiobotonGrad135_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonGrad135 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonGrad135


% --- Executes on button press in radioBotonMagnitud.
function radioBotonMagnitud_Callback(hObject, eventdata, handles)
% hObject    handle to radioBotonMagnitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radioBotonMagnitud


% --- Executes on button press in radiobotonImagenFronteras.
function radiobotonImagenFronteras_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonImagenFronteras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonImagenFronteras


% --- Executes on button press in botonFronteras.
function botonFronteras_Callback(hObject, eventdata, handles)
% hObject    handle to botonFronteras (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.uipanel4,'Visible','on');
set(handles.uipanel5,'Visible','on');
set(handles.uipanel14,'Visible','off');
set(handles.uipanel15,'Visible','off');

guidata(hObject, handles);
    
% --- Executes on button press in botonEsquinas.
function botonEsquinas_Callback(hObject, eventdata, handles)
% hObject    handle to botonEsquinas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.uipanel4,'Visible','off');
set(handles.uipanel5,'Visible','off');
set(handles.uipanel14,'Visible','on');
set(handles.uipanel15,'Visible','on')

guidata(hObject, handles);

% --- Executes on button press in botonDetectar.
function botonDetectar_Callback(hObject, eventdata, handles)
% hObject    handle to botonDetectar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%if(get(handles.botonFronteras,'Value')==1)
if handles.imagen1==0
            errordlg('Una imagen original es necesaria','Error');
else
        
    detector=get(handles.popupmenuDetector,'Value');
    thresh = 0;
    BW = 0;
    umbral = str2num(get(handles.campoUmbral,'String'));
    umbralSup = str2num(get(handles.campoUmbralSuperior,'String'));
    umbralInf = str2num(get(handles.campoUmbralInferior,'String'));
    sigma = str2num(get(handles.campoSigma,'String'));
    
    grad1 = 0; %hace de g45 y de gv dependiendo del detector
    grad2 = 0; %hace de g135 y de gh dependiendo del detector
    
   aux = handles.imagen1; %Guardamos la original
    
    if(get(handles.checkboxAlisar,'Value')==1)
                   
        tamano=str2num(get(handles.campoTamano,'String'));
        
        if(get(handles.radiobotonPromedio,'Value')==1) %PROMEDIO
                                  
            if (mod(tamano,2) ==  0) %Factor impar para mascaras con pixel central
                tamano = tamano+1
            end
            
            A=fspecial('average',tamano);            
            handles.imagen1=imfilter(handles.imagen1,A,'circular');
            
        else if(get(handles.radiobotonGaussiano,'Value')==1) %GAUSSIANO
                
                if (mod(tamano,2) ==  0) %Factor impar para mascaras con pixel central
                    tamano = tamano+1
                end      
                desviacion=tamano;
                A=fspecial('gaussian',13,desviacion);
                handles.imagen1=imfilter(handles.imagen1,A,'circular');
            end
        end
    end
    
    switch detector
        
        case 1 %Roberts MATLAB
     
            %No hay opciones en matlab para especificar gradiente 45 o 135�
            if (get(handles.checkboxUmbral,'Value')==1) %Umbral automatico
                if (get(handles.checkboxEstrechar,'Value')==1) %Thinning
                    [BW,thresh, grad1, grad2] = edge(handles.imagen1,'roberts');                  
                else if (get(handles.checkboxEstrechar,'Value')==0) %Nothinning
                         [BW,thresh, grad1, grad2] = edge(handles.imagen1,'roberts','nothinning');                        
                    end
                end
                           
            else if (get(handles.checkboxUmbral,'Value')==0) %umbral manual                
                    if (get(handles.checkboxEstrechar,'Value')==1) %Thinning
                        [BW,thresh, grad1, grad2] = edge(handles.imagen1,'roberts',umbral);                           
                    else if (get(handles.checkboxEstrechar,'Value')==0) %Nothinning
                        [BW,thresh, grad1, grad2] = edge(handles.imagen1,'roberts',umbral,'nothinning');            
                        end
                    end
                end 
            end
                       
        case 2 %Sobel MATLAB
            
            %RadiobotonDireccion45 = Vertical, Direccion135 = %Horizonal
            %por el cambio en el nombre de los campos
            if (get(handles.checkboxUmbral,'Value')==1) %Umbral automatico
                if (get(handles.checkboxEstrechar,'Value')==1) %Thinning
                    if (get(handles.radiobotonDireccionAmbos,'Value')==1) %Ambas direcciones
                        [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel','both'); 
                    else if(get(handles.radiobotonDireccion45,'Value')==1)
                           [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel','vertical'); %Direccion vertical
                                else if(get(handles.radiobotonDireccion135,'Value')==1) 
                                        [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel','horizontal'); %Direccion horizontal
                                    end
                        end
                    end
                else if (get(handles.checkboxEstrechar,'Value')==0) %Thinning
                        if (get(handles.radiobotonDireccionAmbos,'Value')==1) %Ambas direcciones
                            [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel','both','nothinning'); 
                        else if(get(handles.radiobotonDireccion45,'Value')==1) %Direccion vertical
                                [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel','vertical','nothinning');
                                    else if(get(handles.radiobotonDireccion135,'Value')==1)  %Direccion horizontal
                                            [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel','horizontal','nothinning');
                                        end
                            end
                        end
                    end
                end
                           
            else if (get(handles.checkboxUmbral,'Value')==0) %Umbral manual                   
                    if (get(handles.checkboxEstrechar,'Value')==1) %Thinning
                        if (get(handles.radiobotonDireccionAmbos,'Value')==1) %Ambas direcciones
                            [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel',umbral,'both');
                        else if(get(handles.radiobotonDireccion45,'Value')==1)  %Direccion vertical
                                [BW,thresh, grad1, grad2]  = edge(handles.imagen1,'sobel',umbral,'vertical');
                                    else if(get(handles.radiobotonDireccion135,'Value')==1) %Direccion horizontal
                                            [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel',umbral,'horizontal'); 
                                        end
                            end
                        end                
                    else if (get(handles.checkboxEstrechar,'Value')==0) %Nothinning
                            if (get(handles.radiobotonDireccionAmbos,'Value')==1)
                                [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel',umbral,'both'); %Ambas direcciones
                            else if(get(handles.radiobotonDireccion45,'Value')==1) 
                                [BW,thresh, grad1, grad2]  = edge(handles.imagen1,'sobel',umbral,'vertical');  %Direccion vertical
                                   else if(get(handles.radiobotonDireccion135,'Value')==1)
                                        [BW,thresh, grad1, grad2] = edge(handles.imagen1,'sobel',umbral,'horizontal'); %Direccion horizontal
                                       end
                                end
                            end                     
                        end                
                    end
                end
            end
            
        case 3 %Prewitt MATLAB

            %RadiobotonDireccion45 = Vertical, Direccion135 = %Horizonal por el cambio en el nombre de los campos
            if (get(handles.checkboxUmbral,'Value')==1) %Umbral automatico
                if (get(handles.radiobotonDireccionAmbos,'Value')==1) %Ambas direcciones
                    [BW,thresh] = edge(handles.imagen1,'prewitt','both'); 
                else if(get(handles.radiobotonDireccion45,'Value')==1)
                        [BW,thresh] = edge(handles.imagen1,'prewitt','vertical'); %Direccion vertical
                    else if(get(handles.radiobotonDireccion135,'Value')==1) 
                            [BW,thresh] = edge(handles.imagen1,'prewitt','horizontal'); %Direccion horizontal
                        end
                    end
                end
                                           
            else if (get(handles.checkboxUmbral,'Value')==0) %Umbral manual                   
                    if (get(handles.radiobotonDireccionAmbos,'Value')==1) %Ambas direcciones
                        BW = edge(handles.imagen1,'prewitt',umbral,'both');
                    else if(get(handles.radiobotonDireccion45,'Value')==1)  %Direccion vertical
                            BW = edge(handles.imagen1,'prewitt',umbral,'vertical');                           
                        else if(get(handles.radiobotonDireccion135,'Value')==1) %Direccion horizontal
                                BW= edge(handles.imagen1,'prewitt',umbral,'horizontal'); 
                            end
                        end
                    end    
                end
            end
            
        case 4 %Canny MATLAB

            if (get(handles.checkboxUmbral2,'Value')==1) %Umbrales automaticos
                [BW,thresh] = edge(handles.imagen1,'canny'); %No deja meter sigma sin umbral
            else if (get(handles.checkboxUmbral2, 'Value')==0)
                    b = umbralSup;
                    a = umbralInf;
                    thresh = [a,b]; %vector umbral
                    BW = edge(handles.imagen1,'canny', thresh, sigma);
                end
            end
            
        case 5 %Roberts
            
            f1=[1 0; 0 -1];
            f2=[0 1; -1 0];
                        
            if(get(handles.radiobotonDireccionAmbos,'Value')==1) %Ambos
            
                grad1 = imfilter(double(handles.imagen1),f1,'replicate');
                grad2 = imfilter(double(handles.imagen1),f2,'replicate');
                I1=grad1.*grad1;
                I2=grad2.*grad2;
                G=I1+I2;
                
            else if(get(handles.radiobotonDireccion45,'Value')==1) %45�
                    
                    grad2 = imfilter(double(handles.imagen1),f2,'replicate');          
                    I2=grad2.*grad2;
                    G=I2;       
                    
                else if(get(handles.radiobotonDireccion135,'Value')==1) %135�

                        grad1 = imfilter(double(handles.imagen1),f1,'replicate');
                        I1=grad1.*grad1;
                        G=I1;
                    end
                end
            end
            
            A=G > umbral;
            BW = A;
            thresh = umbral;

    
                                    
        case 6 %Sobel
            
            f1=[1 2 1; 0 0 0; -1 -2 -1];
            f2=[1 0 -1; 2 0 -2; 1 0 -1];  
            
            G = 0;
            
            if(get(handles.radiobotonDireccionAmbos,'Value')==1) %Ambas direcciones
            
                grad1 = imfilter(double(handles.imagen1),f1,'replicate');
                grad2 = imfilter(double(handles.imagen1),f2,'replicate');
                I1=grad1.*grad1;
                I2=grad2.*grad2;
                G=I1+I2;
                
            else if(get(handles.radiobotonDireccion45,'Value')==1) %Vertical
                    
                    grad2 = imfilter(double(handles.imagen1),f2,'replicate');          
                    I2=grad2.*grad2;
                    G=I2;       
                    
                else if(get(handles.radiobotonDireccion135,'Value')==1) %Horizontal

                        grad1 = imfilter(double(handles.imagen1),f1,'replicate');
                        I1=grad1.*grad1;
                        G=I1;
                    end
                end
            end
            
            G=sqrt(G);
            A=G > umbral;
            BW = A;
            thresh = umbral;

        case 7 %Prewitt
            
            f1=[1 1 1; 0 0 0; -1 -1 -1];
            f2=[1 0 -1; 1 0 -1; 1 0 -1];               
            f1=[1 2 1; 0 0 0; -1 -2 -1];
            f2=[1 0 -1; 2 0 -2; 1 0 -1];  
            
            if(get(handles.radiobotonDireccionAmbos,'Value')==1) %Ambas direcciones
            
                grad1 = imfilter(double(handles.imagen1),f1,'replicate');
                grad2 = imfilter(double(handles.imagen1),f2,'replicate');
                I1=grad1.*grad1;
                I2=grad2.*grad2;
                G=I1+I2;
                
            else if(get(handles.radiobotonDireccion45,'Value')==1) %Vertical
                    
                    grad2 = imfilter(double(handles.imagen1),f2,'replicate');          
                    I2=grad2.*grad2;
                    G=I2;       
                    
                else if(get(handles.radiobotonDireccion135,'Value')==1) %Horizontal

                        grad1 = imfilter(double(handles.imagen1),f1,'replicate');
                        I1=grad1.*grad1;
                        G=I1;
                    end
                end
            end
            
            G=sqrt(G);
            A=G > umbral;
            BW = A;
            thresh = umbral;

            
            
    end
 
    %Visualizacion

    if (get(handles.checkboxUmbral,'Value')==1)
        set(handles.campoUmbral,'String',thresh);
    end
    
    if (get(handles.checkboxUmbral2,'Value')==1)
        set(handles.campoUmbralSuperior,'String',thresh(2));
        set(handles.campoUmbralInferior,'String',thresh(1)); 
    end

    %axes(handles.axes2);
    %handles.imagen2 = BW;
    %imagesc(handles.imagen2), axis off
    
    if(get(handles.radiobotonFronteras,'Value')==1)

        axes(handles.axes2);
        imagesc(BW), colormap(gray(256)), axis off

    else if (get(handles.radiobotonGradiente45,'Value')==1)
            
            axes(handles.axes2);
            imagesc(grad1), axis off
          
            else if (get(handles.radiobotonGradiente135,'Value')==1)

                    axes(handles.axes2);
                    imagesc(grad2), axis off
                       
                    else if (get(handles.radiobotonImagenFronteras,'Value')==1)

                        axes(handles.axes2);
                        imagesc(handles.imagen1), axis off, hold on;
                        [filas, columnas] = find(BW); %Para coger los coordenadas de los elementos nonzero
                        plot(columnas,filas,handles.color,'MarkerSize',1)
                        hold off;
                        
                        else if(get(handles.radiobotonMagnitud,'Value')==1)
                                
                                G = sqrt((grad1.^2 + grad2.^2));
                                axes(handles.axes2);
                                BW = G;
                                imagesc(G), axis off;              
                            end
                        end
                end       
        end                    
    end
      
    handles.imagen2 = BW;
    handles.imagen1 = aux; %Volvemos a darle la original (sin filtros)
    
    end
    guidata(hObject, handles);


% --- Executes on selection change in popupmenuDetector.
function popupmenuDetector_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuDetector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuDetector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuDetector


detector=get(handles.popupmenuDetector,'Value');
set(handles.campoUmbralSuperior,'Enable','off')
set(handles.campoUmbralInferior,'Enable','off')
set(handles.campoSigma,'Enable','off')
set(handles.checkboxUmbral2,'Enable','off') 
set(handles.radiobotonDireccion45,'Enable','on');
set(handles.radiobotonDireccion135,'Enable','on');
set(handles.checkboxEstrechar,'Enable', 'on');

switch detector
    
    case 1
        
        set(handles.checkboxUmbral,'Enable','On');
        set(handles.checkboxEstrechar,'Enable','On');
        set(handles.radiobotonMagnitud,'Visible', 'on');
        set(handles.radiobotonGradiente45,'Visible', 'on');    
        set(handles.radiobotonGradiente135,'Visible', 'on');
        set(handles.radiobotonDireccion45,'String','45�');
        set(handles.radiobotonDireccion45,'Enable','off');
        set(handles.radiobotonDireccion135,'Enable','off');
        set(handles.radiobotonDireccion135,'String','135�');  
        set(handles.checkboxEstrechar,'Enable', 'on');
        set(handles.radiobotonGradiente45,'String', 'Gradiente 45');
        set(handles.radiobotonGradiente135,'String', 'Gradiente 135');
        
    case 2
        
        set(handles.checkboxUmbral,'Enable','On');
        set(handles.checkboxEstrechar,'Enable','On');
        set(handles.radiobotonMagnitud,'Visible', 'on');
        set(handles.radiobotonGradiente45,'Visible', 'on');    
        set(handles.radiobotonGradiente135,'Visible', 'on');
        set(handles.radiobotonGradiente45,'String', 'Gradiente Vertical');    
        set(handles.radiobotonGradiente135,'String', 'Gradiente Horizontal');
        set(handles.radiobotonDireccion45,'String','Vertical');
        set(handles.radiobotonDireccion135,'String','Horizontal');
        set(handles.radiobotonMagnitud,'Visible', 'on');

    case 3
        
        set(handles.checkboxUmbral,'Enable','On');
        set(handles.radiobotonGradiente45,'Visible', 'off');    
        set(handles.radiobotonGradiente135,'Visible', 'off');
        set(handles.radiobotonMagnitud,'Visible', 'off');
        set(handles.radiobotonGradiente45,'Visible', 'off');    
        set(handles.radiobotonGradiente135,'Visible', 'off');
        set(handles.checkboxEstrechar,'Enable', 'off');

    case 4
        
        set(handles.radiobotonMagnitud,'Visible', 'off');
        set(handles.radiobotonGradiente45,'Visible', 'off');    
        set(handles.radiobotonGradiente135,'Visible', 'off');
        set(handles.campoUmbralSuperior,'Enable','on');
        set(handles.campoUmbralInferior,'Enable','on');
        set(handles.campoSigma,'Enable','on');
        set(handles.checkboxUmbral2,'Enable','on');        
    
    case 5
        
        set(handles.radiobotonMagnitud,'Visible', 'on');
        set(handles.radiobotonGradiente45,'Visible', 'on');    
        set(handles.radiobotonGradiente135,'Visible', 'on');
        set(handles.radiobotonDireccion45,'String','45�');
        set(handles.radiobotonDireccion45,'Enable','on');
        set(handles.radiobotonDireccion135,'Enable','on');
        set(handles.radiobotonDireccion135,'String','135�');  
        set(handles.checkboxEstrechar,'Enable', 'off');
        set(handles.checkboxUmbral,'Enable', 'off');
        set(handles.radiobotonGradiente45,'String', 'Gradiente 45');
        set(handles.radiobotonGradiente135,'String', 'Gradiente 135');

    case 6
 
        set(handles.checkboxEstrechar,'Enable','off');  
        set(handles.checkboxUmbral,'Enable','off');
        set(handles.radiobotonMagnitud,'Visible', 'on');
        set(handles.radiobotonGradiente45,'Visible', 'on');    
        set(handles.radiobotonGradiente135,'Visible', 'on');
        set(handles.radiobotonGradiente45,'String', 'Gradiente Vertical');    
        set(handles.radiobotonGradiente135,'String', 'Gradiente Horizontal');
        set(handles.radiobotonDireccion45,'String','Vertical');
        set(handles.radiobotonDireccion135,'String','Horizontal');
        set(handles.radiobotonMagnitud,'Visible', 'on');
     
    case 7
        
        set(handles.radiobotonGradiente45,'Visible', 'off');    
        set(handles.radiobotonGradiente135,'Visible', 'off');
        set(handles.radiobotonMagnitud,'Visible', 'off');
        set(handles.radiobotonGradiente45,'Visible', 'off');    
        set(handles.radiobotonGradiente135,'Visible', 'off');
        set(handles.checkboxEstrechar,'Enable', 'off');        

    end


guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenuDetector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuDetector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxAlisar.
function checkboxAlisar_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxAlisar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxAlisar

if (get(hObject,'Value')==0)
    
    set(handles.campoTamano,'enable', 'off');
    set(handles.radiobotonPromedio,'enable', 'off');
    set(handles.radiobotonGaussiano,'enable', 'off');
    
    else if (get(hObject,'Value')==1)
                
        set(handles.campoTamano,'enable', 'on');
        set(handles.radiobotonPromedio,'enable', 'on');
        set(handles.radiobotonGaussiano,'enable', 'on');
        end
    
end
        
handles.output = hObject;
guidata(hObject, handles);
        

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


% --- Executes on button press in checkboxUmbral.
function checkboxUmbral_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxUmbral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxUmbral


% --- Executes on button press in checkboxEstrechar.
function checkboxEstrechar_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxEstrechar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxEstrechar



function campoUmbral_Callback(hObject, eventdata, handles)
% hObject    handle to campoUmbral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoUmbral as text
%        str2double(get(hObject,'String')) returns contents of campoUmbral as a double


% --- Executes during object creation, after setting all properties.
function campoUmbral_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoUmbral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uipanel6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function campoUmbralInferior_Callback(hObject, eventdata, handles)
% hObject    handle to campoUmbralInferior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoUmbralInferior as text
%        str2double(get(hObject,'String')) returns contents of campoUmbralInferior as a double


% --- Executes during object creation, after setting all properties.
function campoUmbralInferior_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoUmbralInferior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function campoSigma_Callback(hObject, eventdata, handles)
% hObject    handle to campoSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoSigma as text
%        str2double(get(hObject,'String')) returns contents of campoSigma as a double


% --- Executes during object creation, after setting all properties.
function campoSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function campoUmbralSuperior_Callback(hObject, eventdata, handles)
% hObject    handle to campoUmbralSuperior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoUmbralSuperior as text
%        str2double(get(hObject,'String')) returns contents of campoUmbralSuperior as a double


% --- Executes during object creation, after setting all properties.
function campoUmbralSuperior_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoUmbralSuperior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxUmbral2.
function checkboxUmbral2_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxUmbral2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxUmbral2


% --- Executes when selected object is changed in uipanel13.
function uipanel13_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel13 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if hObject == handles.radiobotonAmarillo
    handles.color='ys';
else if hObject == handles.radiobotonAzul
        handles.color='bs';
    else if hObject == handles.radiobotonBlanco
            handles.color='ws';
         else if hObject == handles.radiobotonRojo
            handles.color='rs';
              else if hObject == handles.radiobotonVerde
                   handles.color='gs';
                    else if hObject == handles.radiobotonNegro
                        handles.color='ks';
                  end
              end
           end
        end
    end
end

guidata(hObject, handles);



function campoUmbralEsquinas_Callback(hObject, eventdata, handles)
% hObject    handle to campoUmbralEsquinas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoUmbralEsquinas as text
%        str2double(get(hObject,'String')) returns contents of campoUmbralEsquinas as a double


% --- Executes during object creation, after setting all properties.
function campoUmbralEsquinas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoUmbralEsquinas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobotonEsquinas.
function radiobotonEsquinas_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonEsquinas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonEsquinas


% --- Executes on button press in radiobotonAutovalores.
function radiobotonAutovalores_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonAutovalores (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonAutovalores


% --- Executes on button press in radiobotonImagenEsquinas.
function radiobotonImagenEsquinas_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonImagenEsquinas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonImagenEsquinas


% --- Executes on button press in checkboxSupresion.
function checkboxSupresion_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxSupresion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxSupresion



function campoDireccion_Callback(hObject, eventdata, handles)
% hObject    handle to campoDireccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of campoDireccion as text
%        str2double(get(hObject,'String')) returns contents of campoDireccion as a double


% --- Executes during object creation, after setting all properties.
function campoDireccion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to campoDireccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobotonVecindario3.
function radiobotonVecindario3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonVecindario3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonVecindario3


% --- Executes on button press in radiobotonVecindario5.
function radiobotonVecindario5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonVecindario5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonVecindario5


% --- Executes on button press in radiobotonVecindario7.
function radiobotonVecindario7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobotonVecindario7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobotonVecindario7


% --- Executes on button press in botonDetectar2.
function botonDetectar2_Callback(hObject, eventdata, handles)
% hObject    handle to botonDetectar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.imagen1==0
            errordlg('Una imagen original es necesaria','Error');

else
    I = handles.imagen1;
    mascara1 = [-1 0 1];
    mascara2 = mascara1(:); %traspuesta
    Ix = imfilter(double(I),mascara1,'replicate'); %Gradiente horizontal
    Iy = imfilter(double(I),mascara1','replicate'); %Gradiente vertical

    %Cogemos tama�o del vecindario
    if(get(handles.radiobotonVecindario3,'Value')==1)
        vecindario=3;
    else if(get(handles.radiobotonVecindario5,'Value')==1)
            vecindario=5;
        else if(get(handles.radiobotonVecindario7,'Value')==1)
                vecindario=7;
            end
        end
    end           

    %C�lculo de los elementos que compondr�n la matriz C

    mascarasuma = ones(vecindario,vecindario);
    Ix2 = Ix.^2;
    Suma_Ix2 = imfilter(double(Ix2),mascarasuma,'replicate');
    Iy2 = Iy.^2;
    Suma_Iy2 = imfilter(double(Iy2),mascarasuma,'replicate');
    Ixy = Ix.*Iy;
    Suma_Ixy = imfilter(double(Ixy),mascarasuma,'replicate');

    [nf,nc]=size(handles.imagen1);
    Autovalores = zeros(nf, nc);
    for i = 1:nf
        for j = 1:nc
            %Construimos la matriz C
            C=([Suma_Ix2(i,j) Suma_Ixy(i,j);Suma_Ixy(i,j) Suma_Iy2(i,j)]);
            d = double(eig(double(C))); %Obtenemos los dos autovalores de C
            Autovalores(i,j) = min(d); %Guardamos el menor autovalor
        end;
    end;

    umbral = str2num(get(handles.campoUmbralEsquinas,'String'));
    Esquinas = Autovalores > umbral;
    %Obtenemos las posiciones de los elementos que superan el umbral
    [filas,columnas] = find(Esquinas);

    if (get(handles.radiobotonEsquinas,'Value')==1) %mostrar esquinas

        axes(handles.axes2);
        imagesc(Esquinas), colormap(gray(256)), axis off, hold off;

    else if (get(handles.radiobotonAutovalores,'Value')==1) %mostrar autovalores

            axes(handles.axes2);
            imagesc(Autovalores), colormap(gray(256)), axis off, hold off;

        else if (get(handles.radiobotonImagenEsquinas,'Value')==1)

                axes(handles.axes2);
                imagesc(handles.imagen1), colormap(gray(256)), axis off, hold on;
                plot(columnas,filas,handles.color,'MarkerSize',4) %Marcamos las esquinas     

            end
        end
    end
end

guidata(hObject, handles);
