============================================================================
MEGA MENU — CONFIGURATION GUIDE
============================================================================

This guide explains how to configure the Mega Menu to display the system's
modules and features.

The configuration is defined through two arrays:

  GRUPOS_MENU
    Defines the groups displayed in the menu.

  ITENS_MENU
    Defines the options available in each group.

Group titles and items are created automatically by the CriarItensMenu
procedure. Therefore, there is no need to create a TLabel manually
for each group or item.

============================================================================
1. HOW TO REGISTER SYSTEM GROUPS
============================================================================

Groups are the categories that organize the system's features.

For example, a system may have the following groups:

  Registrations
  Finance
  Inventory
  Reports

These names are examples only. Use the actual modules in your system.

STEP 1 — DEFINE THE IDENTIFIERS

Locate the existing GRUPO_ constants in the source code.

Each group needs a numeric identifier. This identifier will be used
to associate items with the correct group.

Example:

  GRUPO_CADASTROS = 1;
  GRUPO_FINANCEIRO = 2;
  GRUPO_ESTOQUE = 3;
  GRUPO_RELATORIOS = 4;

These identifiers are examples and must be adapted to the registered
groups.

STEP 2 — SET THE NUMBER OF GROUPS

Locate the constant:

  QUANTIDADE_GRUPOS

Set it to the total number of groups registered in GRUPOS_MENU.

Example:

  QUANTIDADE_GRUPOS = 4;

STEP 3 — REGISTER THE TITLES

Locate the GRUPOS_MENU array.

Each record contains the title of a group.

Example:

  GRUPOS_MENU: array[1..QUANTIDADE_GRUPOS] of TGrupoMenu = (
    (Titulo: 'Cadastros'),
    (Titulo: 'Financeiro'),
    (Titulo: 'Estoque'),
    (Titulo: 'Relatórios')
  );

IMPORTANT:

  - The number of records must match QUANTIDADE_GRUPOS.
  - The first position corresponds to identifier 1, the second to 2,
    and so on.
  - The identifiers must match the positions of the groups.
  - When adding a group, also check the references used by the items
    in ITENS_MENU.

============================================================================
2. HOW TO REGISTER SYSTEM ITEMS
============================================================================

Items are the options displayed within each group.

Example:

  Registrations
    Customers
    Suppliers
    Products

  Finance
    Accounts payable
    Accounts receivable

STEP 1 — SET THE NUMBER OF ITEMS

Locate the constant:

  QUANTIDADE_ITENS_MENU

Set it to the total number of records that will exist in ITENS_MENU.

The previous example contains five items:

  QUANTIDADE_ITENS_MENU = 5;

STEP 2 — REGISTER THE ITEMS

Locate the ITENS_MENU array.

Each record contains two fields:

  Titulo
    The text displayed in the menu.

  Grupo
    Identifies the group to which the item belongs.

Example:

  ITENS_MENU: array[1..QUANTIDADE_ITENS_MENU] of TItemConfiguracao = (
    (Titulo: 'Clientes'; Grupo: GRUPO_CADASTROS),
    (Titulo: 'Fornecedores'; Grupo: GRUPO_CADASTROS),
    (Titulo: 'Produtos'; Grupo: GRUPO_CADASTROS),

    (Titulo: 'Contas a pagar'; Grupo: GRUPO_FINANCEIRO),
    (Titulo: 'Contas a receber'; Grupo: GRUPO_FINANCEIRO)
  );

In this example, the first three items belong to the Registrations group,
while the last two belong to the Finance group.

To register an item in another group, use that group's identifier.

IMPORTANT:

  - The number of records must match QUANTIDADE_ITENS_MENU.
  - Each item must reference an existing group.
  - The title must not be empty.
  - Use the group identifier, not the name written in quotation marks.

============================================================================
3. HOW TO ADD AN ITEM
============================================================================

To add a feature to the menu:

  1. Increment QUANTIDADE_ITENS_MENU.
  2. Add a record to the ITENS_MENU array.
  3. Specify the title to be displayed.
  4. Specify the identifier of the group to which it belongs.

Example: add the Transporters item to the Registrations group.

  (Titulo: 'Transportadoras'; Grupo: GRUPO_CADASTROS)

There is no need to create a TLabel manually.

The CriarItensMenu procedure creates the controls and calculates their
positions according to the menu configuration.

Note: registering an item in the menu does not implement its functionality.
Opening the corresponding screen or executing the associated action must
be handled by the code responsible for the item's click event.

============================================================================
4. HOW TO ADD A GROUP
============================================================================

To add a new module to the menu:

  1. Create a constant identifying the group.
  2. Increment QUANTIDADE_GRUPOS.
  3. Add the title to the GRUPOS_MENU array at the corresponding position.
  4. Add the desired items to the ITENS_MENU array.
  5. Update QUANTIDADE_ITENS_MENU to match the new records.
  6. Check that the identifiers match the positions of the groups.

Example: add the Purchases group.

  GRUPO_COMPRAS = 5;

Add the title:

  (Titulo: 'Compras')

Register items using:

  (Titulo: 'Pedidos de compra'; Grupo: GRUPO_COMPRAS)

The names above are examples. Adapt them to the actual modules and
features of your system.

============================================================================
5. HOW TO CONFIGURE COLUMNS
============================================================================

QUANTIDADE_COLUNAS
------------------
Defines the maximum number of columns available in the Mega Menu.

The project supports a maximum of four columns.

The value must be between 1 and 4 and must match the number of positions
declared in the POS_COLUNA array.

Example with three columns:

  QUANTIDADE_COLUNAS = 3;

  POS_COLUNA: array[1..QUANTIDADE_COLUNAS] of Integer = (71, 360, 650);

In this example, three horizontal positions are available.

To change the number of available columns:

  1. Set QUANTIDADE_COLUNAS to a value between 1 and 4.
  2. Adjust POS_COLUNA to contain the same number of positions.
  3. Check that the positions are in ascending order.

Do not configure more than four columns, as this is the project's
defined limit.


COLUNAS_UTILIZADAS
------------------
Defines how many of the available columns will be used to distribute
the groups.

The value must be between 1 and QUANTIDADE_COLUNAS.

Example:

  QUANTIDADE_COLUNAS = 3;
  COLUNAS_UTILIZADAS = 2;

In this case, the menu uses two of the three available positions.

To use more or fewer columns, change COLUNAS_UTILIZADAS.

There is no need to change QUANTIDADE_COLUNAS when the goal is simply
to use fewer columns, as long as the available positions remain suitable.

============================================================================
6. HOW TO ADJUST SPACING
============================================================================

POS_COLUNA
----------
Defines the horizontal position of each column.

To bring the columns closer together, reduce the distance between values.
To move them farther apart, increase that distance.

Consider the width of groups and items to avoid overlap or content
extending beyond the visible area.


ALTURA_ITEM
-----------
Defines the vertical spacing between items within a group.

Increase the value to space items farther apart.
Decrease it to bring them closer together.


ALTURA_TITULO_GRUPO
-------------------
Defines the height reserved for the group title in vertical positioning
calculations.

Adjust this value when you need to change the space reserved
for group titles.


ESPACO_ENTRE_GRUPOS
-------------------
Defines the additional vertical spacing between rows of groups.

Increase the value to separate the rows.
Decrease it to bring them closer together.

After changing dimensions or positions, check that the content remains
within the form's visible area.

============================================================================
7. SEARCH AND NAVIGATION
============================================================================

Items registered in ITENS_MENU are used by the menu's search and
navigation mechanisms.

Search filters items according to the text entered and displays
the groups that contain matching results.

Keyboard and mouse navigation use the automatically created items.

There is no need to register items separately for search or navigation.

============================================================================
8. CHECKLIST AFTER MAKING CHANGES
============================================================================

After modifying the configuration:

  1. Check QUANTIDADE_GRUPOS and GRUPOS_MENU.
  2. Check the group identifiers.
  3. Check QUANTIDADE_ITENS_MENU and ITENS_MENU.
  4. Verify that each item belongs to an existing group.
  5. Check QUANTIDADE_COLUNAS and POS_COLUNA.
  6. Verify that QUANTIDADE_COLUNAS is between 1 and 4.
  7. Verify that COLUNAS_UTILIZADAS is within the permitted limits.
  8. Compile the project.
  9. Open the menu and test search, navigation, and visual layout.

Compilation checks several configuration errors, but it does not guarantee
that the layout will look correct or that each item's action has been
implemented.

============================================================================
END OF CONFIGURATION GUIDE
============================================================================
