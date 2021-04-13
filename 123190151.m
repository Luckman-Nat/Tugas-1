function varargout = coba(varargin)
% COBA MATLAB code for coba.fig
%      COBA, by itself, creates a new COBA or raises the existing
%      singleton*.
%
%      H = COBA returns the handle to a new COBA or the handle to
%      the existing singleton*.
%
%      COBA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COBA.M with the given input arguments.
%
%      COBA('Property','Value',...) creates a new COBA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before coba_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to coba_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help coba

% Last Modified by GUIDE v2.5 13-Apr-2021 12:16:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @coba_OpeningFcn, ...
                   'gui_OutputFcn',  @coba_OutputFcn, ...
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


% --- Executes just before coba is made visible.
function coba_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to coba (see VARARGIN)

% Choose default command line output for coba
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes coba wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = coba_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in jml.
function jml_Callback(hObject, eventdata, handles)
% hObject    handle to jml (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
penjualan = get(handles.penjualan,'string');
pekerja = get(handles.pekerja,'string');
biaya = get(handles.biaya,'string');
penjualan = str2double(penjualan);
pekerja = str2double(pekerja);
biaya = str2double(biaya);
biaya =biaya*1000;
orang= pekerja*1000;
sisa=biaya-orang;
cek=rem(orang,biaya);
orang1 = cek/1000;
abs(orang1);
duit=biaya/1000;
if cek==0
    jml1 = orang*2;
    if jml1<penjualan
        set(handles.hasil,'string',('Sedikit'));
        set(handles.sisa,'string',(sisa));
        set(handles.orang,'string',(pekerja));
        set(handles.total,'string',(jml1));
    elseif jml1>=penjualan
        jml3=1000+penjualan;
        orang2=(penjualan/2)+500;
        uang = biaya - (orang2*1000);
        set(handles.hasil,'string',('Banyak'));
        set(handles.sisa,'string',(uang));
        set(handles.orang,'string',(orang2));
        set(handles.total,'string',(jml3));
    elseif jml1==penjualan && duit>=pekerja
        set(handles.hasil,'string',('Pas'));
        set(handles.sisa,'string',(sisa));
        set(handles.orang,'string',(pekerja));
        set(handles.total,'string',(jml1));
    elseif jml1==penjualan && duit<pekerja 
        jml3=duit*2;
        sisa= 0;
        set(handles.hasil,'string',('Pas'));
        set(handles.sisa,'string',(sisa));
        set(handles.orang,'string',(duit));
        set(handles.total,'string',(jml3));
    end
elseif cek~=0
    jml1= orang1*2;
    if jml1<penjualan && duit<pekerja
        jml3= (duit)*2;
        sisa= 0;
        set(handles.hasil,'string',('Sedikit'));
        set(handles.sisa,'string',(sisa));
        set(handles.orang,'string',(duit));
        set(handles.total,'string',(jml3));
    elseif jml1<penjualan
        set(handles.hasil,'string',('Sedikit'));
        set(handles.sisa,'string',(sisa));
        set(handles.orang,'string',(duit));
        set(handles.total,'string',(jml1));
    elseif jml1>=penjualan
        jml2= jml1-penjualan;
        if jml2>1000 && biaya/1000>=pekerja
           jml3=1000+penjualan;
           orang2=(penjualan/2)+500;
           uang = biaya - (orang2*1000);
            set(handles.hasil,'string',('Banyak'));
            set(handles.sisa,'string',(uang));
            set(handles.orang,'string',(orang2));
            set(handles.total,'string',(jml3));
        elseif duit<pekerja
            jml3= (duit)*2;
            sisa= 0;
            set(handles.hasil,'string',('Banyak'));
            set(handles.sisa,'string',(sisa));
            set(handles.orang,'string',(duit));
            set(handles.total,'string',(jml3));
        end
    elseif jml1==penjualan && biaya/1000>=pekerja
        set(handles.hasil,'string',('Pas'));
        set(handles.sisa,'string',(sisa));
        set(handles.orang,'string',(pekerja));
        set(handles.total,'string',(jml1));
    elseif jml1==penjualan && duit<pekerja
        jml3= (duit)*2;
        sisa= 0;
        set(handles.hasil,'string',('Pas'));
        set(handles.sisa,'string',(sisa));
        set(handles.orang,'string',(duit));
        set(handles.total,'string',(jml3));
    end
end
