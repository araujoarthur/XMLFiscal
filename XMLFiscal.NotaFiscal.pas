unit XMLFiscal.NotaFiscal;

interface

uses
SysUtils, ComObj, Classes, IOUtils, XMLDoc, XMLIntf, XMLDom, DateUtils, TypInfo,
  System.Generics.Collections, XMLFiscal.Utils;

type
  TNotaFiscal = class
  type
    TCabecalhoNF = class
    private
      F_UF: String;
      F_CodigoNotaFiscal: String;
      F_Natureza:String;
      F_ModeloFiscal: Integer;
      F_Serie: Integer;
      F_NumeroNotaFiscal:Integer;
      F_DataHoraEmissao: TDateTime;
      F_TipoDocumento: Integer;
      F_IndentificadorDestino: Integer;
      F_CodigoMunicipioDoFatoGerador: Integer;
      F_FormatoImpressao: Integer;
      F_FormaEmissao: Integer;
      F_DigitoVerificador: Integer;
      F_AmbienteDeGeracao: Integer;
      F_Finalidade: Integer;
      F_OperacaoComConsumidorFinal: Boolean;
      F_IndicadorDePresenca: Integer;
      F_IndicadorDeIntermediario: Integer;
      F_ProcessoEmissao: Integer;
      F_VersaoProcesso: string;
      function GetStringModeloFiscal: string;
      function GetStringDHE: string;
      function GetStringTipoDocumento: string;
      function GetStringIdentificadorDestino: string;
      function GetStringFormatoImpressao: string;
      function GetStringFormaEmissao: string;
      function GetStringADG: string;
      function GetStringFinalidade: string;
      function GetStringIDP: string;
      function GetStringIDI: string;
      function GetStringProcessoEmissao: string;
      constructor Create(AUF: String; ACodigoNotaFiscal: String; ANatureza:String; AModeloFiscal: Integer; ASerie: Integer; ANumeroNotaFiscal:Integer; ADataHoraEmissao: TDateTime; ATipoDocumento: Integer; AIndentificadorDestino: Integer; ACodigoMunicipioDoFatoGerador: Integer; AFormatoImpressao: Integer; AFormaEmissao: Integer; ADigitoVerificador: Integer; AAmbienteDeGeracao: Integer; AFinalidade: Integer; AOperacaoComConsumidorFinal: Boolean; AIndicadorDePresenca: Integer; AIndicadorDeIntermediario: Integer; AProcessoEmissao: Integer; AVersaoProcesso: string);
    public
      property UF: string read F_UF;
      property CodigoNotaFiscal: string read F_CodigoNotaFiscal;
      property Natureza: String read F_Natureza;

      property ModeloFiscal: Integer read F_ModeloFiscal;
      property ModeloFiscalString: string read GetStringModeloFiscal;

      property Serie: Integer read F_Serie;
      property NumeroNotaFiscal: Integer read F_NumeroNotaFiscal;

      property DataHoraEmissao: TDateTime read F_DataHoraEmissao;
      property DataHoraEmissaoString: string read GetStringDHE;

      property TipoDocumento: Integer read F_TipoDocumento;
      property TipoDocumentoString: string read GetStringTipoDocumento;

      property IdentificadorDestino: Integer read F_IndentificadorDestino;
      property IdentificadorDestinoString: string read GetStringIdentificadorDestino;

      property CodigoMunicipioDoFatoGerador: Integer read F_CodigoMunicipioDoFatoGerador;

      property FormatoImpressao: Integer read F_FormatoImpressao;
      property FormatoImpressaoString: string read GetStringFormatoImpressao;

      property FormaEmissao: Integer read F_FormaEmissao;
      property FormaEmissaoString: string read GetStringFormaEmissao;

      property DigitoVerificador: Integer read F_DigitoVerificador;

      property AmbienteDeGeracao: Integer read F_AmbienteDeGeracao;
      property AmbienteDeGeracaoString: string read GetStringADG;

      property Finalidade: Integer read F_Finalidade;
      property FinalidadeString: string read GetStringFinalidade;

      property OperacaoComConsumidorFinal: Boolean read F_OperacaoComConsumidorFinal;

      property IndicadorDePresenca: Integer read F_IndicadorDePresenca;
      property IndicadorDePresencaString: string read GetStringIDP;

      property IndicadorDeIntermediario: Integer read F_IndicadorDeIntermediario;
      property IndicadorDeIntermediarioString: string read GetStringIDI;

      property ProcessoEmissao: Integer read F_ProcessoEmissao;
      property ProcessoEmissaoString: string read GetStringProcessoEmissao;

      property VersaoProcesso: string read F_VersaoProcesso;
    end;

    TEndereco = class
    public
      Logradouro: String;
      Numero: Integer;
      Complemento: String;
      Bairro: String;
      CodigoMunicipio: String;
      Municipio: String;
      UF: String;
      CEP: String;
      Pais: String;
      Telefone: String;
    private
      constructor Create(ALogradouro: String; ANumero: Integer; AComplemento: String; ABairro: String; ACodigoMunicipio: String; AMunicipio: String; AUF: String; ACEP: String; APais: String; ATelefone: String);
    end;

    TEmpresa = class
    private
      F_CNPJ:String;
      F_RazaoSocial:String;
      F_NomeFantasia:String;
      F_Endereco: TEndereco;
      F_InscricaoEstadual:String;
      F_RegimeTributario:Integer;
      F_ContribuinteICMS:Integer;
      function GetContribuinteICMSString: string;
      function GetRegimeTributarioString: string;
    public
      constructor Create(ACNPJ:String; ARazaoSocial:String; ANomeFantasia:String; AEndereco: TEndereco; AInscricaoEstadual:String; ARegimeTributario:Integer; AContribuinteICMS:Integer);
      property CNPJ: string read F_CNPJ;
      property RazaoSocial: string read F_RazaoSocial;
      property NomeFantasia: string read F_NomeFantasia;
      property Endereco: TEndereco read F_Endereco;
      property InscricaoEstadual: string read F_InscricaoEstadual;
      property RegimeTributario: integer read F_RegimeTributario;
      property RegimeTributarioString: string read GetRegimeTributarioString;
      property ContribuinteICMS: integer read F_ContribuinteICMS;
      property ContribuinteICMSString: string read GetContribuinteICMSString;
    end;

    TProduto = class
    private
      F_NItem: Integer;
      F_cProd: String;
      F_cEAN: String;
      F_xProd: String;//
      F_NCM: String;
      F_NVE: String;
      F_CEST: String;
      F_CFOP: Integer;
      F_uCom: String;
      F_qCom: Double;
      F_vUnCom: Double;
      F_vProd: Double;
      F_cEANTrib: String; //
      F_uTrib: String; //
      F_qTrib: Double;
      F_vUNTrib: Double;
      F_vFrete: Double;
      F_vSeg: Double;
      F_vDesc: Double;
      F_vOutro: Double;
      F_indTot: Integer;
      F_xPed: String;
      F_nItemPed: String;
      function GetStringIndTot: String;
      constructor Create(ANItem: Integer; AcProd, AcEAN, AxProd, ANCM, ANVE,
                  ACEST: String; ACFOP: Integer; AuCom: String; AqCom, AvUnCom, AvProd: Double; AcEANTrib: String;
                  AuTrib: String; AqTrib, AvUNTrib, AvFrete, AvSeg, AvDesc, AvOutro: Double; AindTot: Integer;
                  AxPed, AnItemPed: String);
    public
      property NumeroItemNF: Integer read F_NItem;
      property CodigoProduto: String read F_cProd;
      property EAN: String read F_cEAN;
      property GTIN: String read F_cEAN; // For compatibility purposes;
      property Descricao: String read F_xProd;
      property NCM: String read F_NCM;
      property NVE: String read F_NVE;
      property CEST: String read F_CEST;
      property CFOP: Integer read F_CFOP;
      property UnidadeComercial: String read F_uCom;
      property QuantidadeComercial: Double read F_qCom;
      property ValorUnitarioComercializacao: Double read F_vUnCom;
      property ValorBruto: Double read F_vProd;
      property EANTributo: String read F_cEANTrib;
      property UnidadeTributavel: string read F_uTrib;
      property QuantidadeTributavel: Double read F_qTrib;
      property ValorUnitarioTributacao: Double read F_vUnTrib;
      property ValorTotalFrete: Double read F_vFrete;
      property ValorTotalSeguro: Double read F_vSeg;
      property ValorTotalDesconto: Double read F_vDesc;
      property ValorDespesasAcessorias: Double read F_vOutro;
      property IndicadorComposicaoValorTotal: Integer read F_indTot;
      property IndicadorComposicaoValorTotalString: String read GetStringIndTot;
    end;

    TTransportadora = class(TEmpresa)
    private
      FEndTransp: TEndereco;
      constructor Create(ACNPJ, AxNome, AIE, AxEnder, AxMun, AUF:String);
      destructor Destroy; override;
    end;

    TTransporte = class
    private
      type
        TVolumeTransporte = class
        private
          FQuantidade: Integer;
          FEspecie: string;
          FPesoL: Double;
          FPesoB: Double;
          constructor Create(AQtd: Integer; AEsp: string; APesoL: Double; APesoB: Double);
        public
          property Quantidade: Integer read FQuantidade;
          property Especie: String read FEspecie;
          property PesoLiquido: Double read FPesoL;
          property PesoBruto: Double read FPesoB;
        end;
    private
      FTransportadora: TTransportadora;
      FVolume: TVolumeTransporte;
      constructor Create(ATransporta: TTransportadora; AqVol:Integer; AEsp: String; ApesoL:Double; ApesoB:Double);
      destructor Destroy; override;
    public
      property Transportadora: TTransportadora read FTransportadora;
      property Volume: TVolumeTransporte read FVolume;
    end;

    TCobranca = class
    private
      type
        TFatura = class
        private
          FnFat: string;
          FvOrig: Double;
          FvDesc: Double;
          FvLiq: Double;
          constructor Create(nFat:string; vOrig,vDesc,vLiq:Double);
        public
          property Numero:string read FnFat;
          property ValorOriginal: Double read FvOrig;
          property ValorDesconto: Double read FvDesc;
          property ValorLiquido: Double read FvLiq;
        end;

        TDuplicata = class
        private

          FnDup: string;
          FdVenc: TDateTime;
          FvDup: Double;
          constructor Create(nDup: String; dVenc: TDateTime; vDup: Double);
        public
          property Numero: string read FnDup;
          property Vencimento: TDateTime read FdVenc;
          property Valor: Double read FvDup;
        end;

    private
      FFatura: TFatura;
      FDuplicata: TDuplicata;
    public
      constructor Create(nFat:string; vOrig, vDesc, vLiq: Double; nDup: string; dVenc: TDateTime; vDup: Double);
      destructor Destroy; override;
      property Fatura:TFatura read FFatura;
      property Duplicata:TDuplicata read FDuplicata;
    end;

    TPagamento = class
    private
      FindPag: Integer;
      FtPag: Integer;
      FvPag: Double;
      constructor Create(indPag, tPag: Integer; vPag:Double);
      function GetStringIFP: string;
    public
      property IndicadorFormaPagamento: integer read FindPag;
      property IndicadorFormaPagamentoString: string read GetStringIFP;
      property FormaDePagamento: integer read FtPag;
      property Valor: Double read FvPag;
    end;

    TICMS = class
    private
      function GetOrigemDescricao: string;
      function GetTipoTributacaoDescricao: string;
    protected
      FTabelaTipoTributacao: TDictionary<string, string>; // To Clear n' Free
      FOriginTable: TDictionary<integer, string>; // To Clear 'n Free
      FTipoTributacao: string;
      FOrigemInteger: Integer;

      function GetTipoTributacaoString(ATrib: string): string;
      function GetOrigemString(AOrigem: Integer): string;
    public
      constructor Create(ATipoTributacao: string; AOrigem: Integer); virtual; final;
      destructor Destroy; override;

      property TipoTributacao: string read FTipoTributacao;
      property TipoTributacaoDescricao: string read GetTipoTributacaoDescricao;
      property Origem: Integer read FOrigemInteger;
      property OrigemDescricao: string read GetOrigemDescricao;
    end;

    TGrupoImposto = class
    private
      FICMS: TICMS;
        function GetICMSField: TICMS;
    public
      constructor Create(AICMS: TICMS);
      destructor Destroy; override;
      property ICMS: TICMS read GetICMSField;
    end;

  private
  { Private Declarations }

    { Fields }
    FPathXML, FPathXSD, FDirtyPath,FParentPathXSD: string;
    FIsValidFile, FIsDocumentOpen: Boolean;
    FXMLDocument: IXMLDocument;
    FXMLRootNode: IXMLNode;
    FEndEmitente, FEndDestinatario: TEndereco;
    FEmitente, FDestinatario: TEmpresa;
    FHeader: TCabecalhoNF;
    FProdutos: TArray<TProduto>;
    FTransporte: TTransporte;
    FTransportadora: TTransportadora;
    FCobranca: TCobranca;
    FPagamento: TPagamento;
    FRequiredValidation: Boolean;
    FImpostos: TGrupoImposto;
    { Functions }
    function OpenDocument: Boolean;
    function CloseDocument: Boolean;

    { Procedures }
    procedure SetupHeading(const ANode: IXMLNode);
    procedure SetupBusiness(const ANode: IXMLNode; AField: string);
    procedure SetupAddress(const ANode: IXMLNodeList; AField: string);
    procedure SetupProducts(const ANode: IXMLNodeList; var AProductList:TArray<TProduto>);
    procedure AddProduct(const AProductNode: IXMLNode; var AProductList:TArray<TProduto>);
    procedure SetupTransport(const ANode: IXMLNode);
    procedure SetupCobranca(const ANode: IXMLNode);
    procedure SetupPagamento(const ANode: IXMLNode);
    procedure SetupImpostos(const ANode: IXMLNode);
    { Properties }
    property IsDocumentOpen:Boolean read FIsDocumentOpen;

  public
  { Public Declarations }

    { Constructor, Destructor}
    constructor Create(APathXSD, APathXML: string; AClean: Boolean = True; AValidate: Boolean = True);
    destructor Destroy; override;
    { Functions }

    { Valida um XML contra um esquema de validação @code(.xsd)}
    function isValid(APathXSD, APathXML: string): Boolean;


    { Procedures }


    { Properties }
    property Validado: Boolean read FIsValidFile;
    property Cabecalho: TCabecalhoNF read FHeader;
    property Emitente: TEmpresa read FEmitente;
    property Destinatario: TEmpresa read FDestinatario;
    property Produtos: TArray<TProduto> read FProdutos;
    property Impostos: TGrupoImposto read FImpostos;
    property Transporte: TTransporte read FTransporte;
    property Cobranca: TCobranca read FCobranca;
    property Pagamento: TPagamento read FPagamento;
    property RequerValidacao: Boolean read FRequiredValidation;


  end;

function GetXMLFiscalCurrentVersion:string;
implementation

function GetXMLFiscalCurrentVersion:string;
begin
  Result := '1.0.1';
end;
{ TXMLFiscal }

procedure TNotaFiscal.AddProduct(const AProductNode: IXMLNode; var AProductList: TArray<TProduto>);
var
  NewProduct: TProduto;

  NItem, CFOP, indTot: Integer;

  qCom, vUnCom, vProd, qTrib,
  vUnTrib, vFrete, vSeg, vDesc, vOutro: Double;

  xPed, nItemPed, uTrib, uCom, cProd,
  cEAN, xProd, NCM, NVE, CEST, cEANTrib: String;
  ProductElementList: IXMLNodeList;

  FmtSettings: TFormatSettings;
  ProductElementNode: IXMLNode;
begin
  FmtSettings := TFormatSettings.Create;
  FmtSettings.DecimalSeparator := '.';

  if AProductNode.HasChildNodes then
  begin

    ProductElementNode := AProductNode.ChildNodes.FindNode('prod');
    {
      The above line causes access violation if 3 conditions are met:
        1. AddProduct is inside a loop;
        2. It's the first time the Loop ancestor method/function is ran;
        3. It's currently the second iteration of the loop.

      If any all these 3 don't happen to occur at the same time, it yields the desired result.
      If these 3 conditions are met at once and the Access Violation happens, retrying to run
      it will yield the correct and desired result.

      I have no Idea of what's happening here.
    }

    if ProductElementNode <> nil then
    begin
      ProductElementList := ProductElementNode.ChildNodes;

      // nItem Attribute
      if AProductNode.HasAttribute('nItem') then
      begin
        nItem := AProductNode.AttributeNodes.FindNode('nItem').Text.ToInteger;
      end else
      begin
        nItem := -1;
      end;

      // Codigo do Produto
      if ProductElementList.FindNode('cProd') <> nil then
      begin
        cProd := ProductElementList.FindNode('cProd').Text;
      end else begin
        cProd := 'Não Informado';
      end;

      // EAN
      if ProductElementList.FindNode('cEAN') <> nil then
      begin
        cEAN := ProductElementList.FindNode('cEAN').Text;
      end else begin
        cEAN := 'Não Informado';
      end;

      // Descricao Produto
      if ProductElementList.FindNode('xProd') <> nil then
      begin
        xProd := ProductElementList.FindNode('xProd').Text;
      end else begin
        xProd := 'Não Informado';
      end;

      // NCM
      if ProductElementList.FindNode('NCM') <> nil then
      begin
        NCM := ProductElementList.FindNode('NCM').Text;
      end else begin
        NCM := 'Não Informado';
      end;

      // NVE
      if ProductElementList.FindNode('NVE') <> nil then
      begin
        NVE := ProductElementList.FindNode('NVE').Text;
      end else begin
        NVE := 'Não Informado';
      end;

      // CEST
      if ProductElementList.FindNode('CEST') <> nil then
      begin
        CEST := ProductElementList.FindNode('CEST').Text;
      end else begin
        CEST := 'Não Informado';
      end;

      // CFOP
      if ProductElementList.FindNode('CFOP') <> nil then
      begin
        CFOP := ProductElementList.FindNode('CFOP').Text.ToInteger;
      end else begin
        CFOP := -1;
      end;

      // Unidade Comercial
      if ProductElementList.FindNode('uCom') <> nil then
      begin
        uCom := ProductElementList.FindNode('uCom').Text;
      end else begin
        uCom := 'Não Informado';
      end;

      // Quantidade Comercial
      if ProductElementList.FindNode('qCom') <> nil then
      begin
        qCom := StrToFloat(ProductElementList.FindNode('qCom').Text, FmtSettings);
      end else begin
        qCom := -1;
      end;

      // Valor Unitario de Comercialização
      if ProductElementList.FindNode('vUnCom') <> nil then
      begin
        vUnCom := StrToFloat(ProductElementList.FindNode('vUnCom').Text, FmtSettings);
      end else begin
        vUnCom := -1;
      end;

      // Valor Bruto do Produto ou Serviço
      if ProductElementList.FindNode('vProd') <> nil then
      begin
        vProd := StrToFloat(ProductElementList.FindNode('vProd').Text, FmtSettings);
      end else begin
        vProd := -1;
      end;

      // EAN Tributo
      if ProductElementList.FindNode('cEANTrib') <> nil then
      begin
        cEANTrib := ProductElementList.FindNode('cEANTrib').Text;
      end else begin
        cEANTrib := 'Nâo Informado';
      end;

      // Unidade Tributável
      if ProductElementList.FindNode('uTrib') <> nil then
      begin
        uTrib := ProductElementList.FindNode('uTrib').Text;
      end else begin
        uTrib := 'Não Informado';
      end;

      // Quantidade Tributável
      if ProductElementList.FindNode('qTrib') <> nil then
      begin
        qTrib := StrToFloat(ProductElementList.FindNode('qTrib').Text, FmtSettings);
      end else begin
        qTrib := -1;
      end;

      // Valor Unitário de Tributação
      if ProductElementList.FindNode('vUnTrib') <> nil then
      begin
        vUnTrib := StrToFloat(ProductElementList.FindNode('vUnTrib').Text, FmtSettings);
      end else begin
        vUnTrib := -1;
      end;

      // Valor Frete
      if ProductElementList.FindNode('vFrete') <> nil then
      begin
        vFrete := StrToFloat(ProductElementList.FindNode('vFrete').Text, FmtSettings);
      end else begin
        vFrete := -1;
      end;

      // Valor Seguro
      if ProductElementList.FindNode('vSeg') <> nil then
      begin
        vSeg := StrToFloat(ProductElementList.FindNode('vSeg').Text, FmtSettings);
      end else begin
        vSeg := -1;
      end;

      // Valor Desconto
      if ProductElementList.FindNode('vDesc') <> nil then
      begin
        vDesc := StrToFloat(ProductElementList.FindNode('vDesc').Text, FmtSettings);
      end else begin
        vDesc := -1;
      end;

      // Valor Despesas Acessorias
      if ProductElementList.FindNode('vOutro') <> nil then
      begin
        vOutro := StrToFloat(ProductElementList.FindNode('vOutro').Text, FmtSettings);
      end else begin
        vOutro := -1;
      end;

      // Indicador de Componente do Valor Total
      if ProductElementList.FindNode('indTot') <> nil then
      begin
        indTot := ProductElementList.FindNode('indTot').Text.ToInteger;
      end else begin
        indTot := -1;
      end;

      // xPed - Informações de interesse do emitente para controle B2B
      if ProductElementList.FindNode('xPed') <> nil then
      begin
        xPed := ProductElementList.FindNode('xPed').Text;
      end else begin
        xPed := 'Não Informado';
      end;

      // xPed - Informações de interesse do emitente para controle B2B
      if ProductElementList.FindNode('nItemPed') <> nil then
      begin
        nItemPed := ProductElementList.FindNode('nItemPed').Text;
      end else begin
        nItemPed := 'Não Informado';
      end;

      NewProduct := TProduto.Create(nItem, cProd, cEAN, xProd, NCM, NVE, CEST, CFOP, uCom, qCom, vUnCom, vProd, cEANTrib, uTrib, qTrib, vUnTrib, vFrete, vSeg, vDesc, vOutro, indTot, xPed, nItemPed);
      TXMLUtils.AppendToArray<TProduto>(NewProduct, AProductList);

    end;
  end;
  ProductElementList := nil;
  ProductElementNode := nil;
end;

function TNotaFiscal.CloseDocument: Boolean;
begin
  if not IsDocumentOpen then
  begin
    result := True;
    exit;
  end;

  FXMLDocument := nil;
  FIsDocumentOpen := False;
  result := True;
end;

constructor TNotaFiscal.Create(APathXSD, APathXML: string; AClean: Boolean = True; AValidate: Boolean = True);
begin
  FIsDocumentOpen := False;
  FRequiredValidation := AValidate;

  if not FileExists(APathXML) then
  begin
    raise Exception.Create('O arquivo XML não existe no diretório informado.');
  end;

  if not FileExists(APathXSD) then
  begin
    raise Exception.Create('O arquivo XSD não existe no diretório informado.');
  end;

  FDirtyPath := ExtractFilePath(APathXSD);
  FParentPathXSD := ExtractFilePath(APathXML);

  FPathXSD := APathXSD;

  if AClean then
  begin
    FPathXML := TXMLUtils.CleanNewLine(APathXML);
  end else begin
    FPathXML := APathXML
  end;

  if AValidate then begin
    FIsValidFile := isValid(APathXSD, FPathXML);
  end;

  OpenDocument;

  FProdutos := TArray<TProduto>.Create();
  FXMLRootNode := FXMLDocument.DocumentElement.ChildNodes.FindNode('NFe').ChildNodes.FindNode('infNFe');
  SetupHeading(FXMLRootNode);
  SetupBusiness(FXMLRootNode, 'dest');
  SetupBusiness(FXMLRootNode, 'emit');
  SetupProducts(FXMLRootNode.ChildNodes, FProdutos);
  SetupTransport(FXMLRootNode);
  SetupCobranca(FXMLRootNode);
  SetupPagamento(FXMLRootNode);
  SetupImpostos(FXMLRootNode);

  CloseDocument;

end;

destructor TNotaFiscal.Destroy;
begin
  if Assigned(FImpostos) then
    FImpostos.Free;

  FCobranca.Free;
  FTransportadora.Free;  // Se der problema, tentar trocar Transporte e Transportadora de posição.
  FTransporte.Free; // Ou apenas remover o Free de FTranspordadora, uma vez que esta está dentro de FTransporte.
  FProdutos := nil;
  FEmitente.Free;
  FDestinatario.Free;
  FEndEmitente.Free;
  FEndDestinatario.Free;
  FHeader.Free;
  inherited;
end;

function TNotaFiscal.isValid(APathXSD, APathXML: string): Boolean;
var
  Doc: Variant;
  VDoc: Variant;
begin

  VDoc := CreateOLEObject('MSXML2.XMLSchemaCache.6.0');
  VDoc.validateOnLoad := True;
  VDoc.add('http://www.portalfiscal.inf.br/nfe', APathXSD);

  Doc := CreateOLEObject('MSXML2.DOMDocument.6.0');
  Doc.validateOnParse := False;
  Doc.resolveExternals := True;
  Doc.schemas := VDoc;
  Doc.load(APathXML);

  if Doc.parseError.errorCode <> 0 then
  begin
    raise Exception.Create('Unable to load and/or validate XML: ' + Doc.parseError.reason + ' ' + IntToStr(Doc.parseError.errorCode));
  end else begin
    result := True;
  end;
end;

function TNotaFiscal.OpenDocument: Boolean;
begin
  if IsDocumentOpen then
  begin
    result := True;
    exit;
  end;

  FXMLDocument := TXMLDocument.Create(nil);
  FXMLDocument.LoadFromFile(FPathXML);
  FXMLDocument.Active := True;

  FIsDocumentOpen := True;
  result := True;
end;

procedure TNotaFiscal.SetupBusiness(const ANode: IXMLNode; AField: string);
var
  CNPJ, RazaoSocial, NomeFantasia, IE: String;
  CRT,indIEDest: Integer;
  BusinessNode: IXMLNode;
  BusinessChildren: IXMLNodeList;
  AddrNode: IXMLNode;
  AddrChildren: IXMLNodeList;
begin
  if (LowerCase(AField) <> 'emit') and (LowerCase(AField) <> 'dest') then
  begin
    raise Exception.Create('Must assing business to emit or dest');
  end;

  BusinessNode := ANode.ChildNodes.FindNode(LowerCase(AField));

  if BusinessNode <> nil then
  begin
    BusinessChildren := BusinessNode.ChildNodes; // É bem aqui que morre
    AddrNode := BusinessChildren.FindNode('ender'+TXMLUtils.CapitalizeStr(LowerCase(AField)));
    if AddrNode <> nil then
    begin
      AddrChildren := AddrNode.ChildNodes;

      // CNPJ
      if BusinessChildren.FindNode('CNPJ') <> nil then
      begin
        CNPJ := BusinessChildren.FindNode('CNPJ').Text;
      end else begin
        CNPJ := '';
      end;

      // RAZAO SOCIAL
      if BusinessChildren.FindNode('xNome') <> nil then
      begin
        RazaoSocial := BusinessChildren.FindNode('xNome').Text;
      end else begin
        RazaoSocial := '';
      end;

      // NOME FANTASIA
      if BusinessChildren.FindNode('xFant') <> nil then
      begin
        NomeFantasia := BusinessChildren.FindNode('xFant').Text;
      end else begin
        NomeFantasia := '';
      end;

      // INSCRICAO ESTADUAL
      if BusinessChildren.FindNode('IE') <> nil then
      begin
        IE := BusinessChildren.FindNode('IE').Text;
      end else begin
        IE := '';
      end;

      // REGIME TRIBUTARIO
      if BusinessChildren.FindNode('CRT') <> nil then
      begin
        CRT := BusinessChildren.FindNode('CRT').Text.ToInteger;
      end else begin
        CRT := -1;
      end;

      // CONTRIBUINTE ICMS
      if BusinessChildren.FindNode('indIEDest') <> nil then
      begin
        indIEDest := BusinessChildren.FindNode('indIEDest').Text.ToInteger;
      end else begin
        indIEDest := -1;
      end;

      {MemoField.Lines.Add('METHOD: ' + AFIELD + sLineBreak +'CNPJ: ' + CNPJ + sLineBreak +
                  'xNome: ' + RazaoSocial + sLineBreak +
                  'xFant: '+ NomeFantasia + sLineBreak +
                  'IE: '+ IE + sLineBreak +
                  'CRT: ' + inttostr(crt));}

      SetupAddress(AddrChildren, AField);

      if LowerCase(AField) = 'emit' then
      begin
        FEmitente := TEmpresa.Create(CNPJ, RazaoSocial, NomeFantasia, FEndEmitente, IE, CRT, indIEDest);
      end else if LowerCase(AField) = 'dest' then
      begin
        FDestinatario := TEmpresa.Create(CNPJ, RazaoSocial, NomeFantasia, FEndDestinatario, IE, CRT, indIEDest);
      end;

      BusinessChildren := nil;
      BusinessNode := nil;
    end else begin
      raise Exception.Create('emit address node does not exist.');
    end;

  end else begin
    raise Exception.Create('emit node does not exist.');
  end;
end;

procedure TNotaFiscal.SetupCobranca(const ANode: IXMLNode);
var
  CobrancaNode: IXMLNode;
  CobrancaNodeList: IXMLNodeList;
  AuxNode: IXMLNode;
  AuxNodeList: IXMLNodeList;
  nFat, nDup: string;
  vOrig, vLiq, vDesc, vDup: Double;
  dVenc: TDateTime;
  FmtSettings: TFormatSettings;
begin
  FmtSettings := TFormatSettings.Create;
  FmtSettings.DecimalSeparator := '.';
  FmtSettings.DateSeparator := '-';
  FmtSettings.ShortDateFormat := 'yyyy-mm-dd';

  nFat := '';
  nDup := '';
  vOrig := -1;
  vLiq := -1;
  vDesc := -1;
  vDup := -1;
  dVenc := StrToDateTime('1970-01-01', FmtSettings);

  if ANode.HasChildNodes then
  begin
    CobrancaNode := ANode.ChildNodes.FindNode('cobr');
    if CobrancaNode <> nil then
    begin
      CobrancaNodeList := CobrancaNode.ChildNodes;
      AuxNode := CobrancaNodeList.FindNode('fat');
      if AuxNode <> nil then
      begin
        AuxNodeList := AuxNode.ChildNodes;

        if AuxNodeList.FindNode('nFat') <> nil then
        begin
          nFat := AuxNodeList.FindNode('nFat').Text;
        end;

        if AuxNodeList.FindNode('vOrig') <> nil then
        begin
          vOrig := StrToFloat(AuxNodeList.FindNode('vOrig').Text, FmtSettings);
        end;

        if AuxNodeList.FindNode('vDesc') <> nil then
        begin
          vDesc := StrToFloat(AuxNodeList.FindNode('vDesc').Text, FmtSettings);
        end;

        if AuxNodeList.FindNode('vLiq') <> nil then
        begin
          vLiq := StrToFloat(AuxNodeList.FindNode('vLiq').Text, FmtSettings);
        end;
      end;

      AuxNode := CobrancaNodeList.FindNode('dup');
      if AuxNode <> nil then
      begin
        AuxNodeList := AuxNode.ChildNodes;

        if AuxNodeList.FindNode('nDup') <> nil then
        begin
          nDup := AuxNodeList.FindNode('nDup').Text;
        end;

        if AuxNodeList.FindNode('dVenc') <> nil then
        begin
          dVenc := StrToDateTime(AuxNodeList.FindNode('dVenc').Text, FmtSettings);
        end;

        if AuxNodeList.FindNode('vDup') <> nil then
        begin
          vDup := StrToFloat(AuxNodeList.FindNode('vDup').Text, FmtSettings);
        end;
      end;
    end;

    FCobranca := TCobranca.Create(nFat, vOrig, vDesc, vLiq, nDup, dVenc, vDup);
  end;
end;

procedure TNotaFiscal.SetupAddress(const ANode: IXMLNodeList; AField: string);
var
  Lgr, Cpl, Bairro, cMun, xMun, UF, CEP, Pais, Fone: string;
  nro: Integer;
begin
  // Logradouro
  if ANode.FindNode('xLgr') <> nil then
  begin
    Lgr := ANode.FindNode('xLgr').Text;
  end else begin
    Lgr := 'NODE-ERROR';
  end;

  // Numero
  if ANode.FindNode('nro') <> nil then
  begin
    if not TryStrToInt(ANode.FindNode('nro').Text, nro) then
    begin
      nro := -1;
    end;
  end else begin
    nro := -1;
  end;

  // Complemento
  if ANode.FindNode('xCpl') <> nil then
  begin
    cpl := ANode.FindNode('xCpl').Text;
  end else begin
    cpl := 'NODE-ERROR';
  end;

  // Bairro
  if ANode.FindNode('xBairro') <> nil then
  begin
    Bairro := ANode.FindNode('xBairro').Text;
  end else begin
    Bairro := 'NODE-ERROR';
  end;

  // cMun
  if ANode.FindNode('cMun') <> nil then
  begin
    cMun := ANode.FindNode('cMun').Text;
  end else begin
    cMun := 'NODE-ERROR';
  end;

  // xMun
  if ANode.FindNode('xMun') <> nil then
  begin
    xMun := ANode.FindNode('xMun').Text;
  end else begin
    xMun := 'NODE-ERROR';
  end;

  // UF
  if ANode.FindNode('UF') <> nil then
  begin
    UF := ANode.FindNode('UF').Text;
  end else begin
    UF := 'NODE-ERROR';
  end;

  // CEP
  if ANode.FindNode('CEP') <> nil then
  begin
    CEP := ANode.FindNode('CEP').Text;
  end else begin
    CEP := 'NODE-ERROR';
  end;

  // Pais
  if ANode.FindNode('xPais') <> nil then
  begin
    Pais := ANode.FindNode('xPais').Text;
  end else begin
    Pais := 'NODE-ERROR';
  end;

  // Fone
  if ANode.FindNode('fone') <> nil then
  begin
    Fone := ANode.FindNode('fone').Text;
  end else begin
    Fone := 'NODE-ERROR';
  end;

  if LowerCase(AField) = 'emit' then
  begin
    FEndEmitente := TEndereco.Create(Lgr, nro, cpl, bairro, cMun, xMun, UF, CEP, Pais, Fone);
    {MemoField.Lines.Add('EMIT' + sLineBreak +  'Lgr: '+ Lgr + sLineBreak + 'nro: '+ IntToStr(nro) + sLineBreak+
    'cpl: ' + cpl + sLineBreak + ' bairro: ' + bairro + sLineBreak +
    'cMun: ' + cMun + sLineBreak + 'xMun: ' + xMun + sLineBreak +
    'UF: ' + UF + sLineBreak + 'CEP: ' + CEP + sLineBreak +  'Pais: ' + Pais + sLineBreak +
    'Fone: '+ Fone);}
  end else if LowerCase(AField) = 'dest' then
  begin
    FEndDestinatario := TEndereco.Create(Lgr, nro, cpl, bairro, cMun, xMun, UF, CEP, Pais, Fone);
    {MemoField.Lines.Add('DEST' + sLineBreak +  'Lgr: '+ Lgr + sLineBreak + 'nro: '+ IntToStr(nro) + sLineBreak+
    'cpl: ' + cpl + sLineBreak + ' bairro: ' + bairro + sLineBreak +
    'cMun: ' + cMun + sLineBreak + 'xMun: ' + xMun + sLineBreak +
    'UF: ' + UF + sLineBreak + 'CEP: ' + CEP + sLineBreak +  'Pais: ' + Pais + sLineBreak +
    'Fone: '+ Fone);}
  end else
  begin
    raise Exception.Create('Must assign Address to Emit or Dest Field;');
  end;

end;

procedure TNotaFiscal.SetupHeading(const ANode: IXMLNode);
var
  VIDENode: IXMLNode;
  VIDENodeList: IXMLNodeList;
  cUF: String;
  cNF: String;
  natOp: string;
  ModFis: Integer;
  serie: Integer;
  NrNota: Integer;
  dhEmi: TDateTime;
  tpNF: Integer;
  idDest: Integer;
  cMunFG: Integer;
  tpImp: Integer;
  tpEmis: Integer;
  cDV: Integer;
  tpAmb: Integer;
  finNFe: Integer;
  indFinal: Boolean;
  indPres: Integer;
  indIntermed: Integer;
  procEmi: Integer;
  verProc: string;
begin
  VIDENode := ANode.ChildNodes.FindNode('ide');
  VIDENodeList := VIDENode.ChildNodes;

  // UF EMISSAO
  if VIDENodeList.FindNode('cUF') <> nil then
  begin
    cUF := TXMLUtils.UFCodeToStr(VIDENodeList.FindNode('cUF').Text.ToInteger);
  end else begin
    cUF := 'NODE-ERROR';
  end;

  //CODIGO VERIFICADOR NF
  if VIDENodeList.FindNode('cNF') <> nil then
  begin
    cNF := VIDENodeList.FindNode('cNF').Text;
  end else begin
    cNF := 'NODE-ERROR';
  end;

  // NATUREZA DA OPERACAO
  if VIDENodeList.FindNode('natOp') <> nil then
  begin
    natOp := VIDENodeList.FindNode('natOp').Text;
  end else begin
    natOp := 'NODE-ERROR';
  end;

  // MODELO FISCAL
  if VIDENodeList.FindNode('mod') <> nil then
  begin
    ModFis := VIDENodeList.FindNode('mod').Text.ToInteger;
  end else begin
    ModFis := -1;
  end;

  // SERIE DA NOTA
  if VIDENodeList.FindNode('serie') <> nil then
  begin
    serie := VIDENodeList.FindNode('serie').Text.ToInteger;
  end else begin
    serie := -1;
  end;

  // NUMERO DA NOTA
  if VIDENodeList.FindNode('nNF') <> nil then
  begin
    NrNota := VIDENodeList.FindNode('nNF').Text.ToInteger;
  end else begin
    NrNota := -1;
  end;

  // DATAHORA EMISSAO
  if VIDENodeList.FindNode('dhEmi') <> nil then
  begin
    dhEmi := ISO8601ToDate(VIDENodeList.FindNode('dhEmi').Text);
  end else begin
    dhEmi := StrToDate('01/01/1970');
  end;

  // TIPO DE DOCUMENTO FISCAL
  if VIDENodeList.FindNode('tpNF') <> nil then
  begin
    tpNF := VIDENodeList.FindNode('tpNF').Text.ToInteger;
  end else begin
    tpNF := -1;
  end;

  // Identificador de Local de destino da operação FISCAL
  if VIDENodeList.FindNode('idDest') <> nil then
  begin
    idDest := VIDENodeList.FindNode('idDest').Text.ToInteger;
  end else begin
    idDest := -1;
  end;

  // Código do Município de Ocorrência do Fato Gerador
  if VIDENodeList.FindNode('cMunFG') <> nil then
  begin
    cMunFG := VIDENodeList.FindNode('cMunFG').Text.ToInteger;
  end else begin
    cMunFG := -1;
  end;

  // Formato de impressão do DANFE
  if VIDENodeList.FindNode('tpImp') <> nil then
  begin
    tpImp := VIDENodeList.FindNode('tpImp').Text.ToInteger;
  end else begin
    tpImp := -1;
  end;

  // FORMA DE EMISSAO DA NFE
  if VIDENodeList.FindNode('tpEmis') <> nil then
  begin
    tpEmis := VIDENodeList.FindNode('tpEmis').Text.ToInteger;
  end else begin
    tpEmis := -1;
  end;

  // CODIGO VERIFICADOR NFE
  if VIDENodeList.FindNode('cDV') <> nil then
  begin
    cDV := VIDENodeList.FindNode('cDV').Text.ToInteger;
  end else begin
    cDV := -1;
  end;

  // Identificação do Ambiente
  if VIDENodeList.FindNode('tpAmb') <> nil then
  begin
    tpAmb := VIDENodeList.FindNode('tpAmb').Text.ToInteger;
  end else begin
    tpAmb := -1;
  end;

  // FINALIDADE NFE
  if VIDENodeList.FindNode('finNFe') <> nil then
  begin
    finNFe := VIDENodeList.FindNode('finNFe').Text.ToInteger;
  end else begin
    finNFe := -1;
  end;

  // Indica operação com consumidor final
  if VIDENodeList.FindNode('indFinal') <> nil then
  begin
    if VIDENodeList.FindNode('indFinal').Text.ToInteger = 0 then indFinal := False else indFinal := True;
  end else begin
    indFinal := False;
  end;

  // INDICADOR DE PRESENÇA CONSUMIDOR FINAL
  if VIDENodeList.FindNode('indPres') <> nil then
  begin
    indPres := VIDENodeList.FindNode('indPres').Text.ToInteger;
  end else begin
    indPres := -1;
  end;

  // INDICADOR DE INTERMEDIARIO
  if VIDENodeList.FindNode('indIntermed') <> nil then
  begin
    indIntermed := VIDENodeList.FindNode('indIntermed').Text.ToInteger;
  end else begin
    indIntermed := -1;
  end;

  // Processo de Emissao
  if VIDENodeList.FindNode('procEmi') <> nil then
  begin
    procEmi := VIDENodeList.FindNode('procEmi').Text.ToInteger;
  end else begin
    procEmi := -1;
  end;

  // VERSAO DO PROCESSO DE EMISSAO
  if VIDENodeList.FindNode('verProc') <> nil then
  begin
    verProc := VIDENodeList.FindNode('verProc').Text;
  end else begin
    verProc := 'NODE-ERROR';
  end;
  FHeader := TCabecalhoNF.Create(cUF,cNF,natOp,
                                 ModFis,serie,NrNota,dhEmi,tpNF,
                                 idDest,cMunFG,tpImp,tpEmis,cDV,
                                 tpAmb,finNFe,indFinal,indPres,
                                 indIntermed,procEmi,verProc);
end;

procedure TNotaFiscal.SetupImpostos(const ANode: IXMLNode);
var
  FinalNode, DetailsNode, ICMSNode, ImpostoNode: IXMLNode;
  NFENodeList, DetailsNodeList, ImpostoNodeList, AuxNodeList: IXMLNodeList;
  NodeNameCut: string;
  OrigemInteger: Integer;
  ICMSObject: TICMS;
begin
  FImpostos := nil;
  NFENodeList := ANode.ChildNodes;
  DetailsNode := NFENodeList.FindNode('det');
  if DetailsNode <> nil then
  begin
    DetailsNodeList := DetailsNode.ChildNodes;
    ImpostoNode := DetailsNodeList.FindNode('imposto');
    if ImpostoNode <> nil then
    begin
      ImpostoNodeList := ImpostoNode.ChildNodes;
      ICMSNode := ImpostoNodeList.FindNode('ICMS');
      if ICMSNode <> nil then
      begin
        FinalNode := ICMSNode.ChildNodes.First;
        if FinalNode <> nil then
        begin
          AuxNodeList := FinalNode.ChildNodes;
          NodeNameCut := Copy(FinalNode.NodeName, 5);
          OrigemInteger := StrToInt(AuxNodeList.FindNode('orig').Text);
          ICMSObject := TICMS.Create(NodeNameCut, OrigemInteger);
          FImpostos := TGrupoImposto.Create(ICMSObject);
        end;
      end;
    end;
  end;

end;

//ToDo: Add Tax Information on each product;
procedure TNotaFiscal.SetupPagamento(const ANode: IXMLNode);
var
  PagNode: IXMLNode;
  PagNodeList, AuxNodeList: IXMLNodeList;
  indPag, tPag: integer;
  vPag: Double;
  FmtSettings: TFormatSettings;
begin
  FmtSettings := TFormatSettings.Create;
  FmtSettings.DecimalSeparator := '.';

  indPag := -1;
  tPag := -1;
  vPag := -1;

  PagNodeList := ANode.ChildNodes;
  PagNode := PagNodeList.FindNode('pag');
  if PagNode <> nil then
  begin
    AuxNodeList := PagNode.ChildNodes.FindNode('detPag').ChildNodes;

    if AuxNodeList.FindNode('indPag') <> nil then
    begin
      indPag := AuxNodeList.FindNode('indPag').Text.ToInteger();
    end;

    if AuxNodeList.FindNode('tPag') <> nil then
    begin
      tPag := AuxNodeList.FindNode('tPag').Text.ToInteger;
    end;

    if AuxNodeList.FindNode('vPag') <> nil then
    begin
      vPag := StrToFloat(AuxNodeList.FindNode('vPag').Text, FmtSettings);
    end;

  end;

  FPagamento := TPagamento.Create(indPag, tPag, vPag);
end;

procedure TNotaFiscal.SetupProducts(const ANode: IXMLNodeList; var AProductList:TArray<TProduto>);
var
  I: Integer;
begin
  for I := 0 to ANode.Count - 1 do
  begin
    if LowerCase(ANode[I].NodeName) = 'det' then
    begin
      AddProduct(ANode[I], AProductList);
    end;
  end;

end;

procedure TNotaFiscal.SetupTransport(const ANode: IXMLNode);
var
  TranspCNPJ, TranspNome, TranspIE, TranspEnder, TranspMun, TranspUF: string;
  qVol: Integer;
  Esp:String;
  PesoL,PesoB: Double;

  TransportRootNode: IXMLNode;
  TransportNodeList: IXMLNodeList;
  AuxRootNode: IXMLNode;
  AuxNodeList: IXMLNodeList;
  FmtSettings: TFormatSettings;
begin

  FmtSettings := TFormatSettings.Create;
  FmtSettings.DecimalSeparator := '.';

  TranspCNPJ := '';
  TranspNome := '';
  TranspIE := '';
  TranspEnder := '';
  TranspMun := '';
  TranspUF := '';
  Esp := '';
  qVol := -1;
  PesoL := -1;
  PesoB := -1;

  TransportRootNode := ANode.ChildNodes.FindNode('transp');
  if TransportRootNode <> nil then
  begin
    TransportNodeList := TransportRootNode.ChildNodes;
    AuxRootNode := TransportNodeList.FindNode('transporta');
    if AuxRootNode <> nil then
    begin
      AuxNodeList := AuxRootNode.ChildNodes;

      if AuxNodeList.FindNode('CNPJ') <> nil then
      begin
        TranspCNPJ := AuxNodeList.FindNode('CNPJ').Text;
      end else begin
        TranspCNPJ := '';
      end;

      if AuxNodeList.FindNode('xNome') <> nil then
      begin
        TranspNome := AuxNodeList.FindNode('xNome').Text
      end else begin
        TranspNome := '';
      end;

      if AuxNodeList.FindNode('IE') <> nil then
      begin
        TranspIE := AuxNodeList.FindNode('IE').Text;
      end else begin
        TranspIE := '';
      end;

      if AuxNodeList.FindNode('xEnder') <> nil then
      begin
        TranspEnder := AuxNodeList.FindNode('xEnder').Text;
      end else begin
        TranspEnder := '';
      end;

      if AuxNodeList.FindNode('xMun') <> nil then
      begin
        TranspMun := AuxNodeList.FindNode('xMun').Text;
      end else begin
        TranspMun := '';
      end;

      if AuxNodeList.FindNode('UF') <> nil then
      begin
        TranspUF := AuxNodeList.FindNode('UF').Text;
      end else begin
        TranspUF := '';
      end;

    end;

    AuxRootNode := TransportNodeList.FindNode('vol');
    if AuxRootNode <> nil then
    begin
      AuxNodeList := AuxRootNode.ChildNodes;

      if AuxNodeList.FindNode('qVol') <> nil then
      begin
        qVol := AuxNodeList.FindNode('qVol').Text.ToInteger();
      end else begin
        qVol := -1;
      end;

      if AuxNodeList.FindNode('esp') <> nil then
      begin
        esp := AuxNodeList.FindNode('esp').Text;
      end else begin
        esp := '';
      end;

      if AuxNodeList.FindNode('pesoL') <> nil then
      begin
        PesoL := StrToFloat(AuxNodeList.FindNode('pesoL').Text, FmtSettings);
      end else begin
        PesoL := -1;
      end;

      if AuxNodeList.FindNode('pesoB') <> nil then
      begin
        PesoB := StrToFloat(AuxNodeList.FindNode('pesoB').Text, FmtSettings);
      end else begin
        PesoB := -1;
      end;

    end;
  end;

  FTransportadora := TTransportadora.Create(TranspCNPJ, TranspNome, TranspIE, TranspEnder, TranspMun, TranspUF);
  FTransporte := TTransporte.Create(FTransportadora, qVol, Esp, PesoL, PesoB);
end;

{ TXMLFiscal.TCabecalhoNF }

constructor TNotaFiscal.TCabecalhoNF.Create(AUF: String; ACodigoNotaFiscal: String; ANatureza:String; AModeloFiscal: Integer; ASerie: Integer; ANumeroNotaFiscal:Integer; ADataHoraEmissao: TDateTime; ATipoDocumento: Integer; AIndentificadorDestino: Integer; ACodigoMunicipioDoFatoGerador: Integer; AFormatoImpressao: Integer; AFormaEmissao: Integer; ADigitoVerificador: Integer; AAmbienteDeGeracao: Integer; AFinalidade: Integer; AOperacaoComConsumidorFinal: Boolean; AIndicadorDePresenca: Integer; AIndicadorDeIntermediario: Integer; AProcessoEmissao: Integer; AVersaoProcesso: string);
begin
  F_UF := AUF;
  F_CodigoNotaFiscal := ACodigoNotaFiscal;
  F_Natureza := ANatureza;
  F_ModeloFiscal := AModeloFiscal;
  F_Serie := ASerie;
  F_NumeroNotaFiscal:= ANumeroNotaFiscal;
  F_DataHoraEmissao := ADataHoraEmissao;
  F_TipoDocumento := ATipoDocumento;
  F_IndentificadorDestino := AIndentificadorDestino;
  F_CodigoMunicipioDoFatoGerador := ACodigoMunicipioDoFatoGerador;
  F_FormatoImpressao := AFormatoImpressao;
  F_FormaEmissao := AFormaEmissao;
  F_DigitoVerificador := ADigitoVerificador;
  F_AmbienteDeGeracao := AAmbienteDeGeracao;
  F_Finalidade := AFinalidade;
  F_OperacaoComConsumidorFinal := AOperacaoComConsumidorFinal;
  F_IndicadorDePresenca := AIndicadorDePresenca;
  F_IndicadorDeIntermediario := AIndicadorDeIntermediario;
  F_ProcessoEmissao := AProcessoEmissao;
  F_VersaoProcesso := AVersaoProcesso;
end;

function TNotaFiscal.TCabecalhoNF.GetStringADG: string;
begin
  case F_AmbienteDeGeracao of
    1: result := 'Produção';
    2: result := 'Homologação';
    -1:result := 'Não Informado';
  end;
end;

function TNotaFiscal.TCabecalhoNF.GetStringDHE: String;
begin
  result := DateTimeToStr(F_DataHoraEmissao);
end;

function TNotaFiscal.TCabecalhoNF.GetStringFinalidade: string;
begin
  case F_Finalidade of
    1: result := 'NFe normal';
    2: result := 'NFe complementar';
    3: result := 'NFe de ajuste';
    4: result := 'Devolução/Retorno';
    -1: result := 'Não Informado';
  end;
end;

function TNotaFiscal.TCabecalhoNF.GetStringFormaEmissao: string;
begin
  case F_FormaEmissao of
    1: result := 'Normal';
    2: result := 'Contingência FS';
    3: result := 'Regime Especial NFF (NT 2021.22)';
    4: result := 'Contingência DPEC';
    5: result := 'Contingência FSDA';
    6: result := 'Contingência SVC - AN';
    7: result := 'Contingência SVC - RS';
    9: result := 'Contingência off-line NFC-e';
    -1: result := 'Não Informado';
  end;
end;

function TNotaFiscal.TCabecalhoNF.GetStringFormatoImpressao: string;
begin
  case F_FormatoImpressao of
    0: result := 'Sem DANFE';
    1: result := 'DANFe Retrato';
    2: result := 'DANFe Paisagem';
    3: result := 'DANFe Simplificado';
    4: result := 'DANFe NFC-e';
    5: result := 'DANFe NFC-e em mensagem eletrônica';
    -1: result := 'Não Informado';
  end;
end;

function TNotaFiscal.TCabecalhoNF.GetStringIdentificadorDestino: string;
begin
  case F_IndentificadorDestino of
    1: result := 'Interna';
    2: result := 'Interestadual';
    3: result := 'Exterior';
    -1: result := 'Não Informado';
  end;
end;

function TNotaFiscal.TCabecalhoNF.GetStringIDI: string;
begin
  case F_IndicadorDeIntermediario of
    0: result := 'Operação sem intermediador';
    1: result := 'Operação em site ou plataforma de terceiros (intermediadores/marketplace)';
    -1: result := 'Não Informado';
  end;
end;

function TNotaFiscal.TCabecalhoNF.GetStringIDP: string;
begin
  case F_IndicadorDePresenca of
    0: result := 'Não se Aplica';
    1: result := 'Operação Presencial';
    2: result := 'Não Presencial, Internet';
    3: result := 'Não Presencial, Teleatendimento';
    4: result := 'NFC-e Entrega em Domicilio';
    5: result := 'Operação Presencial, fora do estabelecimento';
    9: result := 'Não Presencial, outros';
    -1: result := 'Não Informado';
  end;
end;

function TNotaFiscal.TCabecalhoNF.GetStringModeloFiscal: string;
begin
  case F_ModeloFiscal of
    55 : result := 'NF-e';
    65 : result := 'NFC-e';
    -1 : result := 'Não Informado';
  end;
end;

function TNotaFiscal.TCabecalhoNF.GetStringProcessoEmissao: string;
begin
  case F_ProcessoEmissao of
    0: result := 'emissão de NF-e com aplicativo do contribuinte';
    1: result := 'emissão de NF-e avulsa pelo Fisco';
    2: result := 'emissão de NF-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco';
    3: result := 'emissão de NF-e pelo contribuinte com aplicativo fornecido pelo Fisco';
    -1: result := 'Não Informado';
  end;
end;

function TNotaFiscal.TCabecalhoNF.GetStringTipoDocumento: string;
begin
  case F_TipoDocumento of
    0: result := 'Entrada';
    1: result := 'Saida';
    -1: result := 'Não Informado';
  end;
end;

{ TXMLFiscal.TEndereco }

constructor TNotaFiscal.TEndereco.Create(ALogradouro: String; ANumero: Integer; AComplemento,
  ABairro, ACodigoMunicipio, AMunicipio, AUF, ACEP, APais, ATelefone: String);
begin
  Logradouro := ALogradouro;
  Numero := ANumero;
  Complemento := AComplemento;
  Bairro := ABairro;
  CodigoMunicipio := ACodigoMunicipio;
  Municipio := AMunicipio;
  UF := AUF;
  CEP := ACEP;
  Pais := APais;
  Telefone := ATelefone;
end;

{ TXMLFiscal.TEmpresa }

constructor TNotaFiscal.TEmpresa.Create(ACNPJ, ARazaoSocial, ANomeFantasia: String;
  AEndereco: TEndereco; AInscricaoEstadual: String; ARegimeTributario, AContribuinteICMS: Integer);
begin
  F_CNPJ := ACNPJ;
  F_RazaoSocial := ARazaoSocial;
  F_NomeFantasia := ANomeFantasia;
  F_Endereco := AEndereco;
  F_InscricaoEstadual := AInscricaoEstadual;
  F_RegimeTributario := ARegimeTributario;
  F_ContribuinteICMS := AContribuinteICMS;
end;

function TNotaFiscal.TEmpresa.GetContribuinteICMSString: string;
begin
  case F_ContribuinteICMS of
    1: result := 'Contribuinte ICMS pagamento à vista';
    2: result := 'Contribuinte isento de inscriçã';
    9: result := 'Não Contribuinte';
    else result := 'Não Informado';
  end;
end;

function TNotaFiscal.TEmpresa.GetRegimeTributarioString: string;
begin
  case F_RegimeTributario of
    1: result := 'Simples Nacional';
    2: result := 'Simples Nacional – excesso de sublimite de receita bruta';
    3: result := 'Regime Normal';
    else result := 'Não Informado';
  end;
end;

{ TXMLFiscal.TProduto }

constructor TNotaFiscal.TProduto.Create(ANItem: Integer; AcProd, AcEAN, AxProd, ANCM, ANVE,
  ACEST: String; ACFOP: Integer; AuCom: String; AqCom, AvUnCom, AvProd: Double; AcEANTrib: String;
  AuTrib: String; AqTrib, AvUNTrib, AvFrete, AvSeg, AvDesc, AvOutro: Double; AindTot: Integer;
  AxPed, AnItemPed: String);
begin
      F_NItem := ANItem;
      F_cProd:= AcProd ;
      F_cEAN := AcEAN;
      F_xProd := AxProd;
      F_NCM := ANCM;
      F_NVE := ANVE;
      F_CEST := ACEST;
      F_CFOP := ACFOP;
      F_uCom := AuCom;
      F_qCom := AqCom;
      F_vUnCom:= AvUnCom;
      F_vProd := AvProd;
      F_cEANTrib := AcEANTrib;
      F_uTrib := AuTrib;
      F_qTrib := AqTrib;
      F_vUNTrib := AvUNTrib;
      F_vFrete := AvFrete;
      F_vSeg := AvSeg;
      F_vDesc := AvDesc ;
      F_vOutro := AvOutro;
      F_indTot := AindTot;
      F_xPed := AxPed;
      F_nItemPed := AnItemPed;
end;

function TNotaFiscal.TProduto.GetStringIndTot: String;
begin
  case F_indTot of
    0: result := 'Valor do Item Não Compõe Valor Total da NF-e';
    1: result := 'Valor do Item Compõe Valor Total da NF-e';
    else result := 'Não Informado';
  end;
end;

{ TXMLFiscal.TTransportadora }

constructor TNotaFiscal.TTransportadora.Create(ACNPJ, AxNome, AIE, AxEnder, AxMun, AUF: String);

begin
  FEndTransp := TEndereco.Create(AxEnder, -1, '', '', '', AxMun, AUF, '', '', '');
  inherited Create(ACNPJ, AxNome, '', FEndTransp, AIE, -1, -1);
end;

destructor TNotaFiscal.TTransportadora.Destroy;
begin
  FEndTransp.Free;
  inherited;
end;

{ TXMLFiscal.TTransporte.TVolumeTransporte }

constructor TNotaFiscal.TTransporte.TVolumeTransporte.Create(AQtd: Integer; AEsp: string; APesoL,
  APesoB: Double);
begin
  FQuantidade := AQtd;
  FEspecie := AEsp;
  FPesoL := APesoL;
  FPesoB := APesoB;
end;

{ TXMLFiscal.TTransporte }

constructor TNotaFiscal.TTransporte.Create(ATransporta: TTransportadora; AqVol: Integer;
  AEsp: String; ApesoL, ApesoB: Double);
begin
  FTransportadora := ATransporta;
  FVolume := TVolumeTransporte.Create(AqVol, AEsp, ApesoL, ApesoB);
end;

destructor TNotaFiscal.TTransporte.Destroy;
begin
  FVolume.Free;
  inherited
end;

{ TXMLFiscal.TCobranca.TFatura }

constructor TNotaFiscal.TCobranca.TFatura.Create(nFat: string; vOrig, vDesc, vLiq: Double);
begin
  FnFat := nFat;
  FvOrig := vOrig;
  FvDesc := vDesc;
  FvLiq := vLiq;
end;

{ TXMLFiscal.TCobranca.TDuplicata }

constructor TNotaFiscal.TCobranca.TDuplicata.Create(nDup: String; dVenc:TDateTime; vDup: Double);
begin
  FnDup := nDup;
  FdVenc := dVenc;
  FvDup := vDup;
end;

destructor TNotaFiscal.TCobranca.Destroy;
begin
  FFatura.Free;
  FDuplicata.Free;
  inherited;
end;

{ TXMLFiscal.TCobranca }

constructor TNotaFiscal.TCobranca.Create(nFat: string; vOrig, vDesc, vLiq: Double; nDup: string;
  dVenc: TDateTime; vDup: Double);
begin
  FFatura := TFatura.Create(nFat, vOrig, vDesc, vLiq);
  FDuplicata := TDuplicata.Create(nDup, dVenc, vDup);
end;

{ TXMLFiscal.TPagamento }

constructor TNotaFiscal.TPagamento.Create(indPag, tPag: Integer; vPag: Double);
begin
  FindPag := indPag;
  FtPag := tPag;
  FvPag := vPag;
end;

function TNotaFiscal.TPagamento.GetStringIFP: string;
begin
  case FindPag of
    0: result := 'Pagamento à Vista';
    1: result := 'Pagamento à Prazo';
    else result := 'Não Informado';
  end;
end;

{ TNotaFiscal.TICMS }

constructor TNotaFiscal.TICMS.Create(ATipoTributacao: string; AOrigem: Integer);
begin
  FTabelaTipoTributacao := TDictionary<string, string>.Create;
  FTabelaTipoTributacao.Add('00', 'Tributada integralmente');
  FTabelaTipoTributacao.Add('02', 'Tributação monofásica própria sobre combustíveis');
  FTabelaTipoTributacao.Add('10', 'Tributada e com cobrança do ICMS por substituição tributária');
  FTabelaTipoTributacao.Add('15', 'Tributação monofásica própria e com responsabilidade pela retenção sobre combustíveis');
  FTabelaTipoTributacao.Add('20', 'Com redução de base de cálculo');
  FTabelaTipoTributacao.Add('30', 'Isenta ou não tributada e com cobrança do ICMS por substituição tributária');
  FTabelaTipoTributacao.Add('40', 'Isenta');
  FTabelaTipoTributacao.Add('41', 'Não Tributada');
  FTabelaTipoTributacao.Add('50', 'Suspensão');
  FTabelaTipoTributacao.Add('51', 'Diferimento - A exigência do preenchimento das informações do ICMS diferido fica à critério de cada UF.');
  FTabelaTipoTributacao.Add('53', 'Tributação monofásica sobre combustíveis com recolhimento diferido');
  FTabelaTipoTributacao.Add('60', 'ICMS cobrado anteriormente por substituição tributária');
  FTabelaTipoTributacao.Add('61', 'Tributação monofásica sobre combustíveis cobrada anteriormente');
  FTabelaTipoTributacao.Add('70', 'Com redução de base de cálculo e cobrança do ICMS por substituição tributária');
  FTabelaTipoTributacao.Add('90', 'Outras');
  FTabelaTipoTributacao.Add('Part', 'Partilha do ICMS entre a UF de origem e UF de destino ou a UF definida na legislação '+
      'Operação interestadual para consumidor final com partilha do ICMS  devido na operação entre a UF de origem e a UF do destinatário ou ou a UF definida na legislação. (Ex. UF da concessionária de entrega do  veículos)');
  FTabelaTipoTributacao.Add('ST', 'Repasse via Substituto Tributário');
  FTabelaTipoTributacao.Add('101', 'SIMPLES NACIONAL e CSOSN=101');
  FTabelaTipoTributacao.Add('102', 'SIMPLES NACIONAL e CSOSN=102, 103, 300 ou 400');
  FTabelaTipoTributacao.Add('201', 'SIMPLES NACIONAL e CSOSN=201');
  FTabelaTipoTributacao.Add('202', 'SIMPLES NACIONAL e CSOSN=202 ou 203');
  FTabelaTipoTributacao.Add('500', 'SIMPLES NACIONAL,CRT=1 – Simples Nacional e CSOSN=500');
  FTabelaTipoTributacao.Add('900', 'SIMPLES NACIONAL, CRT=1 – Simples Nacional e CSOSN=900');

  FOriginTable := TDictionary<integer, string>.Create;
  FOriginTable.Add(0, 'Nacional');
  FOriginTable.Add(1, 'Estrangeira - Importação Direta');
  FOriginTable.Add(2, 'Estrangeira - Adquirida no Mercado Interno');
  FOriginTable.Add(3, 'Nacional - Conteudo superior 40% e inferior ou igual a 70%');
  FOriginTable.Add(4, 'Nacional - Processos produtivos básicos');
  FOriginTable.Add(5, 'Nacional - conteudo inferior 40%');
  FOriginTable.Add(6, 'Estrangeira - Importação direta, com similar nacional, lista CAMEX');
  FOriginTable.Add(7, 'Estrangeira - mercado interno, sem simular,lista CAMEX');
  FOriginTable.Add(8, 'Nacional, Conteúdo de Importação superior a 70%');

  FTipoTributacao := ATipoTributacao;
  FOrigemInteger := AOrigem;
end;

destructor TNotaFiscal.TICMS.Destroy;
begin
  if Assigned(FTabelaTipoTributacao) then
  begin
    FTabelaTipoTributacao.Clear;
    FTabelaTipoTributacao.Free;
  end;


  if Assigned(FOriginTable) then
  begin
    FOriginTable.Clear;
    FOriginTable.Free;
  end;

  inherited;
end;

function TNotaFiscal.TICMS.GetOrigemDescricao: string;
begin
  Result := GetOrigemString(FOrigemInteger);
end;

function TNotaFiscal.TICMS.GetOrigemString(AOrigem: Integer): string;
var
  strResult: string;
begin
  if FOriginTable.TryGetValue(AOrigem, strResult) then
  begin
    Result := strResult;
  end else
  begin
    Result := 'Nada encontrado para origem ' + IntToStr(AOrigem) +'.';
  end;
end;

function TNotaFiscal.TICMS.GetTipoTributacaoDescricao: string;
begin
  Result := GetTipoTributacaoString(FTipoTributacao);
end;

function TNotaFiscal.TICMS.GetTipoTributacaoString(ATrib: string): string;
var
  strResult: string;
begin
  if FTabelaTipoTributacao.TryGetValue(ATrib, strResult) then
  begin
    Result := strResult;
  end else
  begin
    Result := 'Nada Encontrado para ' + ATrib;
  end;

end;

{ TNotaFiscal.TGrupoImposto }

constructor TNotaFiscal.TGrupoImposto.Create(AICMS: TICMS);
begin
  FICMS := AICMS;
end;

destructor TNotaFiscal.TGrupoImposto.Destroy;
begin
  if Assigned(FICMS) then
    FICMS.Free;

  inherited;
end;

function TNotaFiscal.TGrupoImposto.GetICMSField: TICMS;
begin
  if Assigned(FICMS) then
  begin
    Result := FICMS;
  end else
  begin
    Result := nil;
  end;

end;

end.
