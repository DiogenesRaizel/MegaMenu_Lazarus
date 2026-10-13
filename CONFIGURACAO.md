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
