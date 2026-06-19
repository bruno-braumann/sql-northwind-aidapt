/* Exercicio 8
SQL: Northwind
*/

-- 1. Mostrar o primeiro nome, apelido e data de nascimento dos empregados que são Sales Managers, ordenados por data de nascimento.
SELECT
	[FirstName] AS 'Nome',
	[LastName] AS 'Apelido',
	[BirthDate] AS 'Data_Nascimento',
	[Title] AS 'Titulo' -- (Opcional) para confirmar o Titulo 
	
FROM
	[dbo].[Employees]

WHERE
	[Title] = 'Sales Manager'

ORDER BY
	[BirthDate];


-- 2. Criar uma lista de empregados com o nome completo em maiúsculas numa única coluna e criar uma coluna de saída chamada Género, com base no campo Title of Courtesy (Mrs. e Ms. são do sexo feminino e Mr. do sexo masculino). Considerar que pode existir um empregado sem Género definido, que deve aparecer como Desconhecido.
SELECT 
	UPPER ([FirstName] + ' ' + [LastName]) AS 'Nome_Completo',
	[TitleOfCourtesy], -- Para confirmar os resultados

CASE 
    WHEN [TitleOfCourtesy] IN ('Ms.', 'Mrs.') THEN 'Feminino'
    WHEN [TitleOfCourtesy] = 'Mr.' THEN 'Masculino'
    ELSE 'Desconhecido'
END AS 'Genero'

FROM
	[dbo].[Employees];


-- 3. Selecionar todas as empresas fornecedoras e respetiva pessoa de contacto que sejam da Alemanha.
SELECT
	[CompanyName] AS 'Nome_Empresa',
	[ContactName] AS 'Nome_Contacto',
	[Country] AS 'Pais' -- Para confirmar Pais

FROM
	[dbo].[Suppliers]

WHERE
	[Country] = 'Germany';


-- 4. Criar uma lista com o nome da empresa fornecedora e a pessoa de contacto que não sejam dos Estados Unidos.
SELECT
	[CompanyName] AS 'Nome_Empresa',
	[ContactName] AS 'Nome_Contacto',
	[Country] AS 'Pais' -- Para confirmar Pais

FROM
	[dbo].[Suppliers]

WHERE
	[Country] <> 'USA';


-- 5. Selecionar todos os IDs e nomes dos clientes que sejam do Reino Unido e de Londres.
SELECT
	[CustomerID],
	[CompanyName] AS 'Nome_Empresa',
	[ContactName] AS 'Nome_Contacto',
	[City] AS 'Cidade', -- Para confirmar Cidade
	[Country] AS 'Pais' -- Para confirmar Pais

FROM 
	[dbo].[Customers]

WHERE
	[City] = 'London'
	AND [Country] = 'UK';

-- 6. Identificar os clientes do Reino Unido que não estão sediados em Londres.
SELECT
	[CustomerID],
	[CompanyName] AS 'Nome_Empresa',
	[ContactName] AS 'Nome_Contacto',
	[City] AS 'Cidade', -- Para confirmar Cidade
	[Country] AS 'Pais' -- Para confirmar Pais

FROM 
	[dbo].[Customers]

WHERE
	[City] <> 'London'
	AND [Country] = 'UK';

-- 7. Selecionar as pessoas de contacto dos fornecedores cujo título de contacto começa por "Marketing" ou termina com "Marketing".
SELECT
	[ContactName] AS 'Nome_Contacto',
	[CompanyName] AS 'Nome_Empresa',
	[ContactTitle] AS 'Função' -- Para confirmar titulo

FROM
	[dbo].[Suppliers]

WHERE
	[ContactTitle] LIKE 'Marketing%'
	OR [ContactTitle] LIKE '%Marketing';


-- 8. Mostrar todos os fornecedores que sejam japoneses e trabalhem em marketing ou todos os fornecedores que sejam proprietários do negócio (business owners).
SELECT
	[CompanyName] AS 'Nome_Empresa',
	[ContactName] AS 'Nome_Contacto',
	[ContactTitle] AS 'Função', -- Para confirmar titulo
	[Country] AS 'Pais' -- Para onfirmar Pais

FROM
	[dbo].[Suppliers]

WHERE
	([Country] = 'Japan'
	AND [ContactTitle] LIKE '%Marketing%')
	OR [ContactTitle] = 'Owner'; -- não há nenhum ContactTitle = Business Owners mas há Owner 


-- 9. Criar uma lista de clientes com o nome do cliente numa coluna, país, região e cidade. Quando o campo região for nulo, mostrar "região não definida".
SELECT
	[CompanyName] AS 'Nome_Empresa-Cliente',
	[ContactName] AS 'Nome_Contacto',
	[Country] AS 'Pais',
	CASE
		WHEN [Region] IS NULL THEN 'Regiao nao definida' 
		ELSE [Region]
	END AS 'Regiao',
	[City] AS 'Cidade'

FROM 
	[dbo].[Customers];


-- 10. Identificar os fornecedores com quem trabalhamos que não têm site nem número de fax.
SELECT
	[SupplierID],
	[CompanyName] AS 'Nome_Empresa',
	[ContactName] AS 'Nome_Contacto',
	[Fax],
	[HomePage] AS 'Webpage'

FROM
	[dbo].[Suppliers]

WHERE 
	[Fax] IS NULL
	AND [HomePage] IS NULL;


-- 11. Selecionar todos os clientes que não sejam de Itália, França ou Espanha.
SELECT
	[CustomerID],
	[CompanyName] AS 'Nome_Empresa',
	[ContactName] AS 'Nome_Contacto',
	[Country] AS 'Pais'

FROM	
	[dbo].[Customers]

WHERE
	[Country] IS NULL -- Caso haja resultados nulos e logo não é explicito se corresponde a um destes países
	OR [Country] NOT IN ('Italy', 'France', 'Spain');


-- 12. Mostrar o nome da empresa fornecedora, o nome da pessoa de contacto e o título de contacto, considerando que os que são Owners devem aparecer como "Owner - Não especificado".
SELECT
	[SupplierID],
	[CompanyName] AS 'Nome_Empresa',
	[ContactName] AS 'Nome_Contacto',
	CASE
		WHEN [ContactTitle] = 'Owner' THEN 'Owner - não especificado'
		ELSE [ContactTitle] 
	END AS 'Função'

FROM 
	[dbo].[Suppliers];

-- 13. Mostrar todas as encomendas cujo valor do Freight (porte) seja maior ou igual a 5 e menor ou igual a 10, que tenham sido enviadas para os Estados Unidos e para as quais já conhecemos a data de envio.
SELECT
	[OrderID],
	[OrderDate] AS 'Data_Pedido',
	[ShippedDate] AS 'Data_Envio',
	[Freight] AS 'Valor_Portes',
	[ShipCountry] AS 'Pais_Envio'
	
FROM
	[dbo].[Orders]

WHERE
	[Freight] BETWEEN 5 AND 10
	AND [ShippedDate] IS NOT NULL
	AND [ShipCountry] = 'USA';


-- 14. Selecionar as encomendas para as quais não temos a data de envio e também não conhecemos a região.
SELECT
	[OrderID],
	[OrderDate] AS 'Data_Pedido',
	[ShippedDate] AS 'Data_Envio',
	[ShipRegion] AS 'região_Envio',
	[ShipCountry] AS 'Pais_Envio'

FROM
	[dbo].[Orders]

WHERE
	[ShippedDate] IS NULL
	AND [ShipRegion] IS NULL;


-- 15. Criar uma lista de encomendas que foram enviadas para o Reino Unido (UK) e cujo Freight seja inferior a 40, ou encomendas cujo CustomerID seja "ALFKI" e Freight também seja inferior a 40.
SELECT
	[OrderID],
	[CustomerID],
	[ShippedDate] AS 'Data_Envio',
	[Freight] AS 'Valor_Portes',
	[ShipCountry] AS 'Pais_Envio'

FROM
	[dbo].[Orders]

WHERE
	[Freight] < 40
	AND ([ShipCountry] = 'UK'
	OR [CustomerID] = 'ALFKI'
	);