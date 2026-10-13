{
  ============================================================================
  MEGA-MENU — GUIA DE CONFIGURAÇÃO
  ============================================================================

  Este guia explica como configurar o mega-menu para apresentar os módulos
  e as funcionalidades do sistema.

  A configuração é feita por meio de dois cadastros:

    GRUPOS_MENU
      Define os grupos que aparecem no menu.

    ITENS_MENU
      Define as opções disponíveis em cada grupo.

  Os títulos e os itens são criados automaticamente pelo procedimento
  CriarItensMenu. Portanto, não é necessário criar manualmente um TLabel
  para cada grupo ou item.

  ============================================================================
  1. COMO CADASTRAR OS GRUPOS DO SISTEMA
  ============================================================================

  Os grupos são as categorias que organizam as funcionalidades do sistema.

  Por exemplo, um sistema pode ter os seguintes grupos:

    Cadastros
    Financeiro
    Estoque
    Relatórios

  Esses nomes são apenas exemplos. Utilize os módulos reais do seu sistema.

  PASSO 1 — DEFINIR OS IDENTIFICADORES

  Localize as constantes GRUPO_ existentes no código.

  Cada grupo precisa de um identificador numérico. Esse identificador será
  utilizado para associar os itens ao grupo correto.

  Exemplo:

    GRUPO_CADASTROS = 1;
    GRUPO_FINANCEIRO = 2;
    GRUPO_ESTOQUE = 3;
    GRUPO_RELATORIOS = 4;

  Os identificadores são exemplos e devem ser adaptados aos grupos
  cadastrados.

  PASSO 2 — INFORMAR A QUANTIDADE DE GRUPOS

  Localize a constante:

    QUANTIDADE_GRUPOS

  Informe o total de grupos cadastrados em GRUPOS_MENU.

  Exemplo:

    QUANTIDADE_GRUPOS = 4;

  PASSO 3 — CADASTRAR OS TÍTULOS

  Localize o vetor GRUPOS_MENU.

  Cada registro contém o título de um grupo.

  Exemplo:

    GRUPOS_MENU: array[1..QUANTIDADE_GRUPOS] of TGrupoMenu = (
      (Titulo: 'Cadastros'),
      (Titulo: 'Financeiro'),
      (Titulo: 'Estoque'),
      (Titulo: 'Relatórios')
    );

  IMPORTANTE:

    - A quantidade de registros deve corresponder a QUANTIDADE_GRUPOS.
    - A primeira posição corresponde ao identificador 1, a segunda ao 2,
      e assim sucessivamente.
    - Os identificadores devem corresponder às posições dos grupos.
    - Ao adicionar um grupo, confira também as referências utilizadas
      pelos itens em ITENS_MENU.

  ============================================================================
  2. COMO CADASTRAR OS ITENS DO SISTEMA
  ============================================================================

  Os itens são as opções que aparecem dentro de cada grupo.

  Exemplo:

    Cadastros
      Clientes
      Fornecedores
      Produtos

    Financeiro
      Contas a pagar
      Contas a receber

  PASSO 1 — INFORMAR A QUANTIDADE DE ITENS

  Localize a constante:

    QUANTIDADE_ITENS_MENU

  Informe o total de registros que existirão em ITENS_MENU.

  No exemplo anterior, existem cinco itens:

    QUANTIDADE_ITENS_MENU = 5;

  PASSO 2 — CADASTRAR OS ITENS

  Localize o vetor ITENS_MENU.

  Cada registro possui dois campos:

    Titulo
      É o texto apresentado no menu.

    Grupo
      Identifica o grupo ao qual o item pertence.

  Exemplo:

    ITENS_MENU: array[1..QUANTIDADE_ITENS_MENU] of TItemConfiguracao = (
      (Titulo: 'Clientes'; Grupo: GRUPO_CADASTROS),
      (Titulo: 'Fornecedores'; Grupo: GRUPO_CADASTROS),
      (Titulo: 'Produtos'; Grupo: GRUPO_CADASTROS),

      (Titulo: 'Contas a pagar'; Grupo: GRUPO_FINANCEIRO),
      (Titulo: 'Contas a receber'; Grupo: GRUPO_FINANCEIRO)
    );

  Neste exemplo, os três primeiros itens pertencem ao grupo Cadastros,
  enquanto os dois últimos pertencem ao grupo Financeiro.

  Para cadastrar um item em outro grupo, utilize o identificador desse grupo.

  IMPORTANTE:

    - A quantidade de registros deve corresponder a QUANTIDADE_ITENS_MENU.
    - Cada item deve referenciar um grupo existente.
    - O título deve estar preenchido.
    - Utilize o identificador do grupo, não o nome escrito entre aspas.

  ============================================================================
  3. COMO ADICIONAR UM ITEM
  ============================================================================

  Para adicionar uma funcionalidade ao menu:

    1. Incremente QUANTIDADE_ITENS_MENU.
    2. Acrescente um registro ao vetor ITENS_MENU.
    3. Informe o título que será exibido.
    4. Informe o identificador do grupo ao qual pertence.

  Exemplo: adicionar o item Transportadoras ao grupo Cadastros.

    (Titulo: 'Transportadoras'; Grupo: GRUPO_CADASTROS)

  Não é necessário criar um TLabel manualmente.

  O procedimento CriarItensMenu cria os controles e calcula suas posições
  de acordo com a configuração do menu.

  Observação: cadastrar um item no menu não implementa sua funcionalidade.
  A abertura da tela ou a execução da ação correspondente deve ser tratada
  pelo código responsável pelo clique do item.

  ============================================================================
  4. COMO ADICIONAR UM GRUPO
  ============================================================================

  Para adicionar um novo módulo ao menu:

    1. Crie uma constante identificadora para o grupo.
    2. Incremente QUANTIDADE_GRUPOS.
    3. Acrescente o título ao vetor GRUPOS_MENU, na posição correspondente.
    4. Acrescente os itens desejados ao vetor ITENS_MENU.
    5. Atualize QUANTIDADE_ITENS_MENU de acordo com os novos registros.
    6. Confira se os identificadores correspondem às posições dos grupos.

  Exemplo: adicionar o grupo Compras.

    GRUPO_COMPRAS = 5;

  Acrescente o título:

    (Titulo: 'Compras')

  Cadastre os itens utilizando:

    (Titulo: 'Pedidos de compra'; Grupo: GRUPO_COMPRAS)

  Os nomes acima são exemplos. Adapte-os aos módulos e às funcionalidades
  reais do seu sistema.

  ============================================================================
  5. COMO CONFIGURAR AS COLUNAS
  ============================================================================

  QUANTIDADE_COLUNAS
  ------------------
  Define a quantidade máxima de colunas disponíveis no mega-menu.

  O projeto permite utilizar no máximo quatro colunas.

  O valor deve estar entre 1 e 4 e corresponder à quantidade de posições
  declaradas no vetor POS_COLUNA.

  Exemplo para três colunas:

    QUANTIDADE_COLUNAS = 3;

    POS_COLUNA: array[1..QUANTIDADE_COLUNAS] of Integer = (71, 360, 650);

  Nesse exemplo, existem três posições horizontais disponíveis.

  Para alterar a quantidade de colunas disponíveis:

    1. Defina QUANTIDADE_COLUNAS com um valor entre 1 e 4.
    2. Ajuste POS_COLUNA para conter a mesma quantidade de posições.
    3. Confira se as posições estão em ordem crescente.

  Não configure mais de quatro colunas, pois esse é o limite definido
  para o projeto.


  COLUNAS_UTILIZADAS
  ------------------
  Define quantas colunas disponíveis serão utilizadas na distribuição
  dos grupos.

  O valor deve estar entre 1 e QUANTIDADE_COLUNAS.

  Exemplo:

    QUANTIDADE_COLUNAS = 3;
    COLUNAS_UTILIZADAS = 2;

  Nesse caso, o menu utiliza duas das três posições disponíveis.

  Para utilizar mais ou menos colunas, altere COLUNAS_UTILIZADAS.

  Não é necessário alterar QUANTIDADE_COLUNAS quando o objetivo for apenas
  utilizar menos colunas, desde que as posições disponíveis continuem
  adequadas.

  ============================================================================
  6. COMO AJUSTAR O ESPAÇAMENTO
  ============================================================================

  POS_COLUNA
  ----------
  Define a posição horizontal de cada coluna.

  Para aproximar as colunas, diminua a distância entre os valores.
  Para afastá-las, aumente essa distância.

  Considere a largura dos grupos e dos itens para evitar sobreposições
  ou conteúdo fora da área visível.


  ALTURA_ITEM
  -----------
  Define o intervalo vertical entre os itens de um grupo.

  Aumente o valor para afastar os itens.
  Diminua o valor para aproximá-los.


  ALTURA_TITULO_GRUPO
  -------------------
  Define a altura reservada para o título do grupo nos cálculos
  de posicionamento vertical.

  Ajuste esse valor quando precisar modificar o espaço reservado
  aos títulos dos grupos.


  ESPACO_ENTRE_GRUPOS
  -------------------
  Define o espaçamento vertical adicional entre as fileiras de grupos.

  Aumente o valor para separar as fileiras.
  Diminua o valor para aproximá-las.

  Após alterar as dimensões ou as posições, confira se o conteúdo
  permanece dentro da área visível do formulário.

  ============================================================================
  7. PESQUISA E NAVEGAÇÃO
  ============================================================================

  Os itens cadastrados em ITENS_MENU são utilizados pelo mecanismo de
  pesquisa e pela navegação do menu.

  A pesquisa filtra os itens de acordo com o texto digitado e apresenta
  os grupos que possuem resultados.

  A navegação por teclado e mouse utiliza os itens criados automaticamente.

  Não é necessário cadastrar separadamente os itens para a pesquisa
  ou para a navegação.

  ============================================================================
  8. CONFERÊNCIA APÓS AS ALTERAÇÕES
  ============================================================================

  Depois de modificar a configuração:

    1. Confira QUANTIDADE_GRUPOS e GRUPOS_MENU.
    2. Confira os identificadores dos grupos.
    3. Confira QUANTIDADE_ITENS_MENU e ITENS_MENU.
    4. Verifique se cada item pertence a um grupo existente.
    5. Confira QUANTIDADE_COLUNAS e POS_COLUNA.
    6. Verifique se QUANTIDADE_COLUNAS está entre 1 e 4.
    7. Verifique se COLUNAS_UTILIZADAS está dentro dos limites permitidos.
    8. Compile o projeto.
    9. Abra o menu e teste a pesquisa, a navegação e a distribuição visual.

  A compilação verifica diversos erros de configuração, mas não garante
  que o layout ficará visualmente adequado nem que a ação de cada item
  estará implementada.

  ============================================================================
  FIM DO GUIA DE CONFIGURAÇÃO
  ============================================================================
}

unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ComCtrls, Buttons, StdCtrls,
  LCLType, LMessages, Types,
  LazUTF8;

const
  QUANTIDADE_GRUPOS = 6;
  QUANTIDADE_ITENS_MENU = 33;

  QUANTIDADE_COLUNAS = 4;

  //COLUNAS_UTILIZADAS = 1;
  //COLUNAS_UTILIZADAS = 2;
  //COLUNAS_UTILIZADAS = 3;
  COLUNAS_UTILIZADAS = 4;

  {$IF QUANTIDADE_GRUPOS < 1}
    {$ERROR QUANTIDADE_GRUPOS deve ser maior que zero}
  {$ENDIF}

  {$IF QUANTIDADE_ITENS_MENU < 1}
    {$ERROR QUANTIDADE_ITENS_MENU deve ser maior que zero}
  {$ENDIF}

  {$IF (QUANTIDADE_COLUNAS < 1) OR (QUANTIDADE_COLUNAS > 4)}
    {$ERROR QUANTIDADE_COLUNAS deve estar entre 1 e 4}
  {$ENDIF}

  {$IF (COLUNAS_UTILIZADAS < 1) OR (COLUNAS_UTILIZADAS > QUANTIDADE_COLUNAS)}
    {$ERROR COLUNAS_UTILIZADAS deve estar entre 1 e QUANTIDADE_COLUNAS}
  {$ENDIF}

type

  TItemMenu = record
    Controle: TLabel;
    Grupo: Integer;
    Coluna: Integer;
    Linha: Integer;
  end;

  TGrupoMenu = record
    Titulo: string;
  end;

  TItemConfiguracao = record
    Titulo: string;
    Grupo: Integer;
  end;

  { TfrmMain }

  TfrmMain = class(TForm)
    btnMenu: TBitBtn;
    btnDescer: TButton;
    btnSubir: TButton;
    chkManterMenuAberto: TCheckBox;
    edtPesquisar: TEdit;
    imgIcon: TImage;
    lblMegaMenu: TLabel;
    lblLocalizar: TLabel;
    lblSemResultados: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    sbMenu: TScrollBox;
    tsMenu: TTabSheet;
    procedure btnDescerClick(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnSubirClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ItemMenuClick(Sender: TObject);
    procedure lbItemMenuMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: integer);
    procedure PageControl1Change(Sender: TObject);
    procedure PageControl1CloseTabClicked(Sender: TObject);
    procedure sbMenuMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbMenuMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    FTitulosGrupo: array[1..QUANTIDADE_GRUPOS] of TLabel;
    FColunaGrupo: array[1..QUANTIDADE_GRUPOS] of Integer;
    FPosicaoYGrupo: array[1..QUANTIDADE_GRUPOS] of Integer;
    FItens: array of TItemMenu;
    FItemSelecionado: integer;
    function ItemVisivel(Index: integer): boolean;
    function ItemLabel(Index: integer): TLabel;
    procedure SelecionarItem(Index: integer);
    procedure NavegarItem(Delta: integer);
    procedure CriarAbaMenu(Sender: TObject);
    procedure OcultarMenu;
    procedure ApplicationShortCut(var Msg: TLMKey; var Handled: Boolean);
    procedure CriarItensMenu;
    procedure CriarTituloGrupo(Grupo: Integer);
    procedure AdicionarItem(const Titulo: string;
      Grupo, Linha: Integer);
    procedure AjustarRolagemItem(Index: Integer);
    procedure AtualizarBotoesRolagem;
    procedure AtualizarAreaRolagem;

  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

const

  ALTURA_ITEM = 25;
  ALTURA_TITULO_GRUPO = 25;
  ESPACO_ENTRE_GRUPOS = 20;

  POS_COLUNA: array[1..QUANTIDADE_COLUNAS] of Integer =  (71, 360, 650, 940);

  GRUPO_LINGUAGENS = 1;
  GRUPO_FERRAMENTAS = 2;
  GRUPO_IDES_EDITORES = 3;
  GRUPO_CONTROLE_VERSAO = 4;
  GRUPO_BANCOS_DADOS = 5;
  GRUPO_FRAMEWORKS = 6;

  GRUPOS_MENU: array[1..QUANTIDADE_GRUPOS] of TGrupoMenu = (
    (Titulo: 'Linguagens'),
    (Titulo: 'Ferramentas'),
    (Titulo: 'IDEs e Editores'),
    (Titulo: 'Controle de Versão'),
    (Titulo: 'Bancos de Dados'),
    (Titulo: 'Frameworks')
  );

  ITENS_MENU: array[1..QUANTIDADE_ITENS_MENU] of TItemConfiguracao = (
    (Titulo: 'Object Pascal'; Grupo: GRUPO_LINGUAGENS),
    (Titulo: 'Python'; Grupo: GRUPO_LINGUAGENS),
    (Titulo: 'C'; Grupo: GRUPO_LINGUAGENS),
    (Titulo: 'C++'; Grupo: GRUPO_LINGUAGENS),
    (Titulo: 'Java'; Grupo: GRUPO_LINGUAGENS),
    (Titulo: 'JavaScript'; Grupo: GRUPO_LINGUAGENS),
    (Titulo: 'Rust'; Grupo: GRUPO_LINGUAGENS),
    (Titulo: 'Go'; Grupo: GRUPO_LINGUAGENS),

    (Titulo: 'GDB'; Grupo: GRUPO_FERRAMENTAS),
    (Titulo: 'Make'; Grupo: GRUPO_FERRAMENTAS),
    (Titulo: 'CMake'; Grupo: GRUPO_FERRAMENTAS),
    (Titulo: 'Docker'; Grupo: GRUPO_FERRAMENTAS),
    (Titulo: 'Postman'; Grupo: GRUPO_FERRAMENTAS),

    (Titulo: 'Lazarus'; Grupo: GRUPO_IDES_EDITORES),
    (Titulo: 'Visual Studio Code'; Grupo: GRUPO_IDES_EDITORES),
    (Titulo: 'Visual Studio'; Grupo: GRUPO_IDES_EDITORES),
    (Titulo: 'IntelliJ IDEA'; Grupo: GRUPO_IDES_EDITORES),
    (Titulo: 'Qt Creator'; Grupo: GRUPO_IDES_EDITORES),
    (Titulo: 'Geany'; Grupo: GRUPO_IDES_EDITORES),

    (Titulo: 'Git'; Grupo: GRUPO_CONTROLE_VERSAO),
    (Titulo: 'GitHub'; Grupo: GRUPO_CONTROLE_VERSAO),
    (Titulo: 'GitLab'; Grupo: GRUPO_CONTROLE_VERSAO),
    (Titulo: 'Gitea'; Grupo: GRUPO_CONTROLE_VERSAO),

    (Titulo: 'SQLite'; Grupo: GRUPO_BANCOS_DADOS),
    (Titulo: 'PostgreSQL'; Grupo: GRUPO_BANCOS_DADOS),
    (Titulo: 'MariaDB'; Grupo: GRUPO_BANCOS_DADOS),
    (Titulo: 'MySQL'; Grupo: GRUPO_BANCOS_DADOS),
    (Titulo: 'Firebird'; Grupo: GRUPO_BANCOS_DADOS),
    (Titulo: 'Microsoft SQL Server'; Grupo: GRUPO_BANCOS_DADOS),

    (Titulo: 'Qt'; Grupo: GRUPO_FRAMEWORKS),
    (Titulo: 'GTK'; Grupo: GRUPO_FRAMEWORKS),
    (Titulo: 'React'; Grupo: GRUPO_FRAMEWORKS),
    (Titulo: 'FastAPI'; Grupo: GRUPO_FRAMEWORKS)

  );

  COR_LINK_SELECIONADO = $00F8B48A;

{ TfrmMain }

procedure TfrmMain.btnMenuClick(Sender: TObject);
begin
  tsMenu.TabVisible := True;
  PageControl1.ActivePage := tsMenu;

  edtPesquisar.Clear;
  SelecionarItem(0);

  if edtPesquisar.CanFocus then
    edtPesquisar.SetFocus;
end;

procedure TfrmMain.btnDescerClick(Sender: TObject);
begin
  sbMenu.VertScrollBar.Position :=
    sbMenu.VertScrollBar.Position + (sbMenu.ClientHeight - 40);
  AtualizarBotoesRolagem;

  //if edtPesquisar.CanFocus then
  //  edtPesquisar.SetFocus;
end;

procedure TfrmMain.btnSubirClick(Sender: TObject);
begin
  sbMenu.VertScrollBar.Position :=
    sbMenu.VertScrollBar.Position - (sbMenu.ClientHeight - 40);
  AtualizarBotoesRolagem;

  //if edtPesquisar.CanFocus then
  //  edtPesquisar.SetFocus;
end;

procedure TfrmMain.edtPesquisarChange(Sender: TObject);
var
  Texto: string;
  I, Grupo, Coluna: Integer;
  TotalResultados: Integer;
  GrupoVisivel: array[1..QUANTIDADE_GRUPOS] of Boolean;
  LinhaVisivel: array[1..QUANTIDADE_GRUPOS] of Integer;
  LinhaPosicionamento: array[1..QUANTIDADE_GRUPOS] of Integer;
  PosicaoYGrupo: array[1..QUANTIDADE_GRUPOS] of Integer;
  AlturaGrupo: array[1..QUANTIDADE_GRUPOS] of Integer;
  ProximaPosicaoY: array[1..QUANTIDADE_COLUNAS] of Integer;
  L: TLabel;
begin
  Texto := UTF8LowerCase(Trim(edtPesquisar.Text));
  sbMenu.VertScrollBar.Position := 0;
  TotalResultados := 0;

  for I := 1 to QUANTIDADE_GRUPOS do
  begin
    GrupoVisivel[I] := False;
    LinhaVisivel[I] := 0;
    LinhaPosicionamento[I] := 0;
    PosicaoYGrupo[I] := FPosicaoYGrupo[I];
    AlturaGrupo[I] := 0;
  end;

  { Filtra os itens. }
  for I := 0 to High(FItens) do
  begin
    L := FItens[I].Controle;
    if L = nil then
      Continue;

    Grupo := FItens[I].Grupo;

    L.Visible := (Texto = '') or
      (Pos(Texto, UTF8LowerCase(L.Caption)) > 0);

    if L.Visible then
    begin
      Inc(TotalResultados);
      GrupoVisivel[Grupo] := True;
      Inc(LinhaVisivel[Grupo]);
    end;
  end;

  { Calcula a altura de cada grupo visível. }
  for I := 1 to QUANTIDADE_GRUPOS do
  begin
    if GrupoVisivel[I] then
      AlturaGrupo[I] :=
        30
        + LinhaVisivel[I] * ALTURA_ITEM
        + ESPACO_ENTRE_GRUPOS;
  end;

  { Define a posição inicial de cada coluna. }
  for Coluna := 1 to QUANTIDADE_COLUNAS do
    ProximaPosicaoY[Coluna] := 20;

  { Reposiciona os títulos dos grupos. }
  for Grupo := 1 to QUANTIDADE_GRUPOS do
  begin
    Coluna := FColunaGrupo[Grupo];

    if Texto = '' then
      PosicaoYGrupo[Grupo] := FPosicaoYGrupo[Grupo]
    else if GrupoVisivel[Grupo] then
    begin
      PosicaoYGrupo[Grupo] := ProximaPosicaoY[Coluna];

      ProximaPosicaoY[Coluna] :=
        PosicaoYGrupo[Grupo] + AlturaGrupo[Grupo];
    end;

    if FTitulosGrupo[Grupo] <> nil then
    begin
      FTitulosGrupo[Grupo].Visible :=
        (Texto = '') or GrupoVisivel[Grupo];

      FTitulosGrupo[Grupo].Left :=
        POS_COLUNA[FColunaGrupo[Grupo]];

      FTitulosGrupo[Grupo].Top := PosicaoYGrupo[Grupo];
    end;
  end;

  { Reposiciona os itens de cada grupo. }
  for I := 0 to High(FItens) do
  begin
    L := FItens[I].Controle;
    if L = nil then
      Continue;

    Grupo := FItens[I].Grupo;

    L.Left := POS_COLUNA[FColunaGrupo[Grupo]];

    if not L.Visible then
    begin
      L.Top := FPosicaoYGrupo[Grupo]
        + 30
        + (FItens[I].Linha - 1) * ALTURA_ITEM;

      Continue;
    end;

    if Texto = '' then
      L.Top := FPosicaoYGrupo[Grupo]
        + 30
        + (FItens[I].Linha - 1) * ALTURA_ITEM
    else
    begin
      Inc(LinhaPosicionamento[Grupo]);

      L.Top := PosicaoYGrupo[Grupo]
        + 30
        + (LinhaPosicionamento[Grupo] - 1) * ALTURA_ITEM;
    end;
  end;

  { Exibe a mensagem quando não há resultados. }
  lblSemResultados.Visible :=
    (Texto <> '') and (TotalResultados = 0);

  if lblSemResultados.Visible then
    lblSemResultados.Caption :=
      'Nenhum resultado para "' + Trim(edtPesquisar.Text) + '"';

  { Limpa a seleção se o item selecionado ficou oculto. }
  if (FItemSelecionado > 0) and
     not ItemVisivel(FItemSelecionado) then
    SelecionarItem(0);

  AtualizarAreaRolagem;
  sbMenu.Invalidate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FItemSelecionado := 0;

  CriarItensMenu;

  Application.OnShortcut := @ApplicationShortCut;

//  sbMenu.VertScrollBar.OnScroll := @sbMenuVertScroll;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  Application.OnShortcut := nil;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  // As teclas de navegação só funcionam no menu.
  if PageControl1.ActivePage <> tsMenu then
    Exit;

  if Key = VK_ESCAPE then
  begin
    OcultarMenu;
    Key := 0;
    Exit;
  end;

  if Key = VK_DOWN then
  begin
    NavegarItem(1);
    Key := 0;
    Exit;
  end;

  if Key = VK_UP then
  begin
    NavegarItem(-1);
    Key := 0;
    Exit;
  end;

  if Key = VK_PRIOR then  // Page Up
  begin
    if btnSubir.Enabled then
      btnSubirClick(btnSubir);

    Key := 0;
    Exit;
  end;

  if Key = VK_NEXT then  // Page Down
  begin
    if btnDescer.Enabled then
      btnDescerClick(btnDescer);

    Key := 0;
    Exit;
  end;

  if Key = VK_RETURN then
  begin

    if FItemSelecionado > 0 then
      ItemMenuClick(ItemLabel(FItemSelecionado));

    Key := 0;
    Exit;
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  sbMenu.Height := tsMenu.ClientHeight - sbMenu.Top;

  AtualizarAreaRolagem;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  FItemSelecionado := 0;

  AtualizarAreaRolagem;

  if edtPesquisar.CanFocus then
    edtPesquisar.SetFocus;
end;

procedure TfrmMain.ItemMenuClick(Sender: TObject);
begin
  CriarAbaMenu(Sender);
end;

procedure TfrmMain.lbItemMenuMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: integer);
var
  I, Indice: integer;
  L: TLabel;
begin
  Indice := 0;

  for I := 1 to Length(FItens) do
    if ItemLabel(I) = Sender then
    begin
      Indice := I;
      Break;
    end;

  if not ItemVisivel(Indice) then
    Exit;

  if Indice = FItemSelecionado then
    Exit;

  // Restaura a aparência de todos os itens
  for I := 0 to High(FItens) do
  begin
    L := FItens[I].Controle;

    if L <> nil then
    begin
      L.Font.Size := 11;
      L.Font.Style := [];
      L.Font.Color := clDefault;
    end;
  end;

  // Destaca somente o item sob o mouse
  L := ItemLabel(Indice);

  L.Font.Size := 12;
  L.Font.Style := [fsBold, fsUnderline];
  L.Font.Color := COR_LINK_SELECIONADO;

  FItemSelecionado := Indice;
end;

procedure TfrmMain.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tsMenu then
  begin
    edtPesquisar.Clear;
    SelecionarItem(0);

    if edtPesquisar.CanFocus then
      edtPesquisar.SetFocus;
  end;
end;

procedure TfrmMain.PageControl1CloseTabClicked(Sender: TObject);
var
  Aba: TTabSheet;
begin
  if not (Sender is TTabSheet) then
    Exit;

  Aba := TTabSheet(Sender);

  if Aba = tsMenu then
  begin
    OcultarMenu;
    Exit;
  end;

  Aba.Free;
end;

procedure TfrmMain.sbMenuMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  AtualizarBotoesRolagem;
end;

procedure TfrmMain.sbMenuMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
const
  PASSO = ALTURA_ITEM * 3;
var
  Nova, Maxima: Integer;
begin
  if WheelDelta > 0 then
    Nova := sbMenu.VertScrollBar.Position - PASSO
  else
    Nova := sbMenu.VertScrollBar.Position + PASSO;

  Maxima := sbMenu.VertScrollBar.Range - sbMenu.ClientHeight;
  if Maxima < 0 then
    Maxima := 0;

  if Nova < 0 then
    Nova := 0;
  if Nova > Maxima then
    Nova := Maxima;

  sbMenu.VertScrollBar.Position := Nova;
  AtualizarBotoesRolagem;

  Handled := True;
end;

function TfrmMain.ItemVisivel(Index: integer): boolean;
var
  L: TLabel;
begin
  L := ItemLabel(Index);

  Result := (L <> nil) and L.Visible and L.Enabled;
end;


function TfrmMain.ItemLabel(Index: integer): TLabel;
begin
  if (Index >= 1) and (Index <= Length(FItens)) then
    Result := FItens[Index - 1].Controle
  else
    Result := nil;
end;

procedure TfrmMain.SelecionarItem(Index: integer);
var
  I: integer;
  L: TLabel;
begin
  // Restaura a aparência de todos os itens
  for I := Low(FItens) to High(FItens) do
    if (FItens[I].Controle <> nil) and FItens[I].Controle.Enabled then
    begin
      FItens[I].Controle.Font.Size := 11;
      FItens[I].Controle.Font.Style := [];
      FItens[I].Controle.Font.Color := clDefault;
    end;

  FItemSelecionado := 0;

  L := ItemLabel(Index);

  // Destaca o item selecionado
  if (L <> nil) and L.Enabled and L.Visible then
  begin
    L.Font.Size := 12;
    L.Font.Style := [fsBold, fsUnderline];
    L.Font.Color := COR_LINK_SELECIONADO;
    FItemSelecionado := Index;
  end;

  AjustarRolagemItem(Index);
end;

procedure TfrmMain.NavegarItem(Delta: integer);
var
  Total, NovoIndex, Tentativas: integer;
begin
  Total := Length(FItens);
  if Total = 0 then Exit;

  if FItemSelecionado = 0 then
  begin
    if Delta > 0 then
      NovoIndex := 1
    else
      NovoIndex := Total;
  end
  else
    NovoIndex := FItemSelecionado + Delta;

  if NovoIndex < 1 then
    NovoIndex := Total;

  if NovoIndex > Total then
    NovoIndex := 1;

  Tentativas := 0;

  while not ItemVisivel(NovoIndex) do
  begin
    Inc(Tentativas);

    if Tentativas >= Total then
    begin
      SelecionarItem(0);
      Exit;
    end;

    Inc(NovoIndex, Delta);

    if NovoIndex < 1 then
      NovoIndex := Total;

    if NovoIndex > Total then
      NovoIndex := 1;
  end;

  SelecionarItem(NovoIndex);
end;

procedure TfrmMain.CriarAbaMenu(Sender: TObject);
var
  Aba: TTabSheet;
  I: Integer;
  NomeAba: string;
begin
  if not (Sender is TLabel) then
    Exit;

  NomeAba := TLabel(Sender).Caption;

  { Verifica se a aba já existe }
  for I := 0 to PageControl1.PageCount - 1 do
  begin
    Aba := PageControl1.Pages[I];

    if SameText(Aba.Caption, NomeAba) then
    begin
      if not chkManterMenuAberto.Checked then
      begin
        PageControl1.ActivePage := Aba;
        OcultarMenu;
      end;

      Exit;
    end;
  end;

  { Cria a aba somente se ela não existir }
  Aba := TTabSheet.Create(PageControl1);
  Aba.PageControl := PageControl1;
  Aba.Caption := NomeAba;

  if not chkManterMenuAberto.Checked then
  begin
    PageControl1.ActivePage := Aba;
    OcultarMenu;
  end;
end;

procedure TfrmMain.OcultarMenu;
begin
  if not tsMenu.TabVisible then
    Exit;

  // Retira o foco do controle que está dentro do menu.
  if btnMenu.CanFocus then
    btnMenu.SetFocus;

  tsMenu.TabVisible := False;
end;

procedure TfrmMain.ApplicationShortCut(
  var Msg: TLMKey; var Handled: Boolean);
var
  Indice: Integer;
  Total: Integer;
  Shift: TShiftState;
begin
  if Screen.ActiveForm <> Self then
    Exit;

  Shift := KeyDataToShiftState(Msg.KeyData);

  { Ctrl+M: abrir o menu }
  if (Msg.CharCode = Ord('M')) and (Shift = [ssCtrl]) then
  begin
    if PageControl1.ActivePage <> tsMenu then
      btnMenuClick(btnMenu);

    Handled := True;
    Exit;
  end;

  { Ctrl+W: fechar a aba ativa }
  if (Msg.CharCode = Ord('W')) and (Shift = [ssCtrl]) then
  begin
    if PageControl1.ActivePage = tsMenu then
      OcultarMenu
    else if PageControl1.ActivePage <> nil then
      PageControl1.ActivePage.Free;

    Handled := True;
    Exit;
  end;

  { Ctrl+L: focar a pesquisa do menu }
  if (Msg.CharCode = Ord('L')) and (Shift = [ssCtrl]) then
  begin
    if PageControl1.ActivePage = tsMenu then
    begin
      if edtPesquisar.CanFocus then
      begin
        edtPesquisar.SetFocus;
        edtPesquisar.SelectAll;
      end;

      Handled := True;
    end;

    Exit;
  end;

  { Ctrl+Tab e Ctrl+Shift+Tab: navegar pelas abas }
  if (Msg.CharCode = VK_TAB) and (ssCtrl in Shift) then
  begin
    Total := 0;

    for Indice := 0 to PageControl1.PageCount - 1 do
      if PageControl1.Pages[Indice].TabVisible then
        Inc(Total);

    if Total > 0 then
    begin
      Indice := PageControl1.ActivePageIndex;

      repeat
        if ssShift in Shift then
        begin
          Dec(Indice);
          if Indice < 0 then
            Indice := PageControl1.PageCount - 1;
        end
        else
        begin
          Inc(Indice);
          if Indice >= PageControl1.PageCount then
            Indice := 0;
        end;
      until PageControl1.Pages[Indice].TabVisible;

      PageControl1.ActivePageIndex := Indice;
    end;

    Handled := True;
    Exit;
  end;
end;

procedure TfrmMain.CriarTituloGrupo(Grupo: Integer);
var
  L: TLabel;
begin
  L := TLabel.Create(Self);

  L.ParentFont := False;
  L.Font.Size := 9;
  L.Font.Style := [fsBold];
  //L.Parent := tsMenu;
  L.Parent := sbMenu;

  L.Caption := GRUPOS_MENU[Grupo].Titulo;
  L.Left := POS_COLUNA[FColunaGrupo[Grupo]];
  L.Top := FPosicaoYGrupo[Grupo];

  FTitulosGrupo[Grupo] := L;
end;

procedure TfrmMain.AdicionarItem(const Titulo: string;
  Grupo, Linha: Integer);
var
  L: TLabel;
  N: Integer;
begin
  L := TLabel.Create(Self);

  L.ParentFont := False;
  L.Font.Size := 11;
  L.Font.Style := [];
  //L.Parent := tsMenu;
  L.Parent := sbMenu;

  L.Caption := Titulo;
  L.Left := POS_COLUNA[FColunaGrupo[Grupo]];
  L.Top := FPosicaoYGrupo[Grupo]
    + 30
    + (Linha - 1) * ALTURA_ITEM;

  L.Cursor := crHandPoint;
  L.Font.Color := clDefault;

  L.OnClick := @ItemMenuClick;
  L.OnMouseMove := @lbItemMenuMouseMove;

  N := Length(FItens);
  SetLength(FItens, N + 1);

  FItens[N].Controle := L;
  FItens[N].Grupo := Grupo;
  FItens[N].Coluna := FColunaGrupo[Grupo];
  FItens[N].Linha := Linha;
end;

procedure TfrmMain.AjustarRolagemItem(Index: Integer);
const
  MARGEM = 12;
var
  L: TLabel;
  PosicaoAtual: Integer;
  NovaPosicao: Integer;
begin
  L := ItemLabel(Index);

  if (L = nil) or not L.Visible then
    Exit;

  PosicaoAtual := sbMenu.VertScrollBar.Position;
  NovaPosicao := PosicaoAtual;

  { O item está acima da área visível. }
  if L.Top < PosicaoAtual then
    NovaPosicao := L.Top

  { O item está próximo ou abaixo do rodapé. }
  else if L.Top + L.Height >
          PosicaoAtual + sbMenu.ClientHeight - MARGEM then
    NovaPosicao := L.Top + L.Height
                   - sbMenu.ClientHeight + MARGEM;

  if NovaPosicao < 0 then
    NovaPosicao := 0;

  if NovaPosicao <> PosicaoAtual then
    sbMenu.VertScrollBar.Position := NovaPosicao;

  AtualizarBotoesRolagem;
end;

procedure TfrmMain.AtualizarBotoesRolagem;
var
  HaRolagem: Boolean;
  PosicaoMaxima: Integer;
begin
  { Se o conteúdo passou a caber, a posição precisa voltar ao topo. }
  PosicaoMaxima := sbMenu.VertScrollBar.Range - sbMenu.ClientHeight;
  if PosicaoMaxima < 0 then
    PosicaoMaxima := 0;

  if sbMenu.VertScrollBar.Position > PosicaoMaxima then
    sbMenu.VertScrollBar.Position := PosicaoMaxima;

  HaRolagem := (sbMenu.VertScrollBar.Range > sbMenu.ClientHeight)
    or (sbMenu.VertScrollBar.Position > 0);

  btnSubir.Visible := HaRolagem;
  btnDescer.Visible := HaRolagem;

  btnSubir.Enabled := sbMenu.VertScrollBar.Position > 0;
  btnDescer.Enabled := sbMenu.VertScrollBar.Position + sbMenu.ClientHeight <
                       sbMenu.VertScrollBar.Range;
end;


procedure TfrmMain.AtualizarAreaRolagem;
var
  I, Maximo, Base: Integer;
begin
  Maximo := 0;

  for I := 0 to High(FItens) do
    if (FItens[I].Controle <> nil) and FItens[I].Controle.Visible then
    begin
      Base := FItens[I].Controle.Top + FItens[I].Controle.Height;
      if Base > Maximo then
        Maximo := Base;
    end;

  for I := 1 to QUANTIDADE_GRUPOS do
    if (FTitulosGrupo[I] <> nil) and FTitulosGrupo[I].Visible then
    begin
      Base := FTitulosGrupo[I].Top + FTitulosGrupo[I].Height;
      if Base > Maximo then
        Maximo := Base;
    end;

  sbMenu.VertScrollBar.Range := Maximo + 20;

  AtualizarBotoesRolagem;
end;

procedure TfrmMain.CriarItensMenu;
var
  I, Grupo, Coluna, Fileira: Integer;
  GruposPorFileira: Integer;
  AlturaFileira: array[1..QUANTIDADE_GRUPOS] of Integer;
  ProximaPosicaoY: Integer;
  LinhaGrupo: array[1..QUANTIDADE_GRUPOS] of Integer;
  QuantidadeItens: array[1..QUANTIDADE_GRUPOS] of Integer;
begin
  for I := 1 to QUANTIDADE_GRUPOS do
  begin
    LinhaGrupo[I] := 0;
    QuantidadeItens[I] := 0;
    AlturaFileira[I] := 0;
  end;


  { Conta os itens de cada grupo. }
  for I := 1 to Length(ITENS_MENU) do
  begin
    Grupo := ITENS_MENU[I].Grupo;

    if (Grupo < 1) or (Grupo > QUANTIDADE_GRUPOS) then
      raise Exception.CreateFmt(
        'Item "%s" com grupo inválido: %d',
        [ITENS_MENU[I].Titulo, Grupo]);

    Inc(QuantidadeItens[Grupo]);
  end;

  { Define quantos grupos cabem em cada fileira. }
  GruposPorFileira := COLUNAS_UTILIZADAS;
  ProximaPosicaoY := 20;

  { Calcula a altura necessária para cada fileira. }
  for Grupo := 1 to QUANTIDADE_GRUPOS do
  begin
    Fileira := ((Grupo - 1) div GruposPorFileira) + 1;

    if AlturaFileira[Fileira] <
      ALTURA_TITULO_GRUPO + 5
      + QuantidadeItens[Grupo] * ALTURA_ITEM then
    begin
      AlturaFileira[Fileira] :=
        ALTURA_TITULO_GRUPO + 5
        + QuantidadeItens[Grupo] * ALTURA_ITEM;
    end;
  end;

  { Calcula as posições dos títulos por fileira. }
  for Grupo := 1 to QUANTIDADE_GRUPOS do
  begin
    Fileira := ((Grupo - 1) div GruposPorFileira) + 1;
    Coluna := ((Grupo - 1) mod GruposPorFileira) + 1;

    FColunaGrupo[Grupo] := Coluna;
    FPosicaoYGrupo[Grupo] := ProximaPosicaoY;

    { Avança a posição somente ao terminar a fileira. }
    if (Grupo mod GruposPorFileira = 0)
      or (Grupo = QUANTIDADE_GRUPOS) then
    begin
      ProximaPosicaoY :=
        ProximaPosicaoY
        + AlturaFileira[Fileira]
        + ESPACO_ENTRE_GRUPOS;
    end;
  end;

  { Cria os títulos. }
  for I := 1 to QUANTIDADE_GRUPOS do
    CriarTituloGrupo(I);

  { Cria os itens. }
  for I := 1 to Length(ITENS_MENU) do
  begin
    Grupo := ITENS_MENU[I].Grupo;
    Inc(LinhaGrupo[Grupo]);

    AdicionarItem(
      ITENS_MENU[I].Titulo,
      Grupo,
      LinhaGrupo[Grupo]
    );
  end;

  { Define o limite inferior do conteúdo rolável. }
  sbMenu.VertScrollBar.Range := sbMenu.ClientHeight;

  for I := 0 to High(FItens) do
    if FItens[I].Controle <> nil then
      if FItens[I].Controle.Top +
         FItens[I].Controle.Height + 20 >
         sbMenu.VertScrollBar.Range then
        sbMenu.VertScrollBar.Range :=
          FItens[I].Controle.Top +
          FItens[I].Controle.Height + 20;

  for I := 1 to QUANTIDADE_GRUPOS do
    if FTitulosGrupo[I] <> nil then
      if FTitulosGrupo[I].Top +
         FTitulosGrupo[I].Height + 20 >
         sbMenu.VertScrollBar.Range then
        sbMenu.VertScrollBar.Range :=
          FTitulosGrupo[I].Top +
          FTitulosGrupo[I].Height + 20;

  AtualizarBotoesRolagem;
end;

end.

