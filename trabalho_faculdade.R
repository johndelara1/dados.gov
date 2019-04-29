#########################################################
# 	            Ministério do Planejamento              #
#                Desenvolvimento e Gestão               #
# CRIADO - 24 de Setembro de 2014, 16:17 (UTC-03:00)    # 
# ATUALIZADO - 22 de Outubro de 2018, 16:58 (UTC-03:00) #
#                   Frequência - Mensal                 #
#########################################################

# Fornecedores de SC tenho apenas 500 de 15.138

# Ministério do Planejamento, Desenvolvimento e Gestão - MP
# O Ministério do Planejamento, Desenvolvimento e Gestão (MP) é um órgão integrante do poder Executivo Federal, que atua na:
#   
#   Formulação do planejamento estratégico nacional;
# Avaliação dos impactos socioeconômicos das políticas e programas do governo federal e na elaboração de estudos especiais para a reformulação de políticas;
# Realização de estudos e pesquisas para acompanhamento da conjuntura socioeconômica e gestão dos sistemas cartográficos e estatísticos nacionais;
# Elaboração, acompanhamento e avaliação das leis de iniciativa do Poder Executivo federal previstas no art. 165 da Constituição;
# Viabilização de novas fontes de recursos para os planos de governo;
# Coordenação da gestão de parcerias público-privadas (PPP’s);
# Coordenação do Programa de Aceleração do Crescimento – PAC;
# Formulação de diretrizes, coordenação das negociações, acompanhamento e avaliação dos financiamentos externos de projetos públicos com organismos multilaterais e agências governamentais;
# Coordenação e gestão dos sistemas de planejamento e orçamento federal, de pessoal civil, de administração de recursos da informação e informática e de serviços gerais, bem como das ações de organização e modernização administrativa do governo federal;
# Formulação de diretrizes, coordenação e definição de critérios de governança corporativa das empresas estatais federais;
# Administração patrimonial; e
# Política e diretrizes para modernização da administração pública federal.


# http://dados.gov.br/dataset/compras-publicas-do-governo-federal


library(readr)
contratos <- read_csv("http://compras.dados.gov.br/contratos/v1/contratos.csv")
#[1] "Identificador do Contrato"        "UASG"                            
#[3] "Modalidade da Licitação"          "Número do Aviso da Licitação"    
#[5] "Código do Contrato"               "Licitação associada"             
#[7] "Origem da Licitação"              "Número"                          
#[9] "Objeto"                           "Número de Aditivos"              
#[11] "Número do Processo"               "CPF Contratada"                  
#[13] "CNPJ Contratada"                  "Data de Assinatura"              
#[15] "Fundamento Legal"                 "Data de Início da Vigência"      
#[17] "Data de Termino da Vigência"      "Valor inicial"                   
#[19] "Aditivos do Contrato > uri"       "Apostilamentos do Contrato > uri"
#[21] "Eventos do Contrato > uri" 

fornecedor <- function(x){
  sprintf('http://compras.dados.gov.br/fornecedores/v1/fornecedores.csv?uf=SC&offset=%02d', x)
}

fornecedoresSC <- read_csv("http://compras.dados.gov.br/fornecedores/v1/fornecedores.csv?uf=SC")

i = 500
while(i <= 15000){
  forn <- fornecedor(i)
  forn <- read_csv(forn)
  fornecedoresSC = rbind(fornecedoresSC, forn)
  i = i + 500
}




#fornecedoresSC2 <- read_csv("http://compras.dados.gov.br/fornecedores/v1/fornecedores.csv?uf=SC&offset=1000")

#fornecedoresSC3 <- read_csv("http://compras.dados.gov.br/fornecedores/v1/fornecedores.csv?uf=SC&offset=1500")

#fornecedoresSC4 <- read_csv("http://compras.dados.gov.br/fornecedores/v1/fornecedores.csv?uf=SC&offset=2000")


#[1] "Id"                   "CNPJ"                
#[3] "CPF"                  "Nome"                
#[5] "Ativo"                "Recadastrado"        
#[7] "Município"            "UF"                  
#[9] "Natureza Jurídica"    "Porte da Empresa"    
#[11] "Ramo do Negócio"      "Unidade Cadastradora"
#[13] "CNAE"                 "CNAE Secundário"     
#[15] "Habilitado a Licitar"
IRP <- read_csv("http://compras.dados.gov.br/licitacoes/v1/irps.csv")
#[1] "UASG"                                        
#[2] "Número da IRP"                               
#[3] "Modalidade da Licitação"                     
#[4] "Número do Aviso da Licitação"                
#[5] "Tipo da Licitação"                           
#[6] "Justificativa da Modalidade"                 
#[7] "Objeto"                                      
#[8] "CPF do Responsável"                          
#[9] "Nome do Responsável"                         
#[10] "Prazo de Validade (em meses)"                
#[11] "Município da UASG gerenciadora da IRP"       
#[12] "UF da UASG gerenciadora da IRP"              
#[13] "Situação da IRP"                             
#[14] "Órgão da UASG"                               
#[15] "Data provável da licitação"                  
#[16] "Itens da intenção de registro de preço > uri"
licitações <- read_csv("http://compras.dados.gov.br/licitacoes/v1/licitacoes.csv")
#[1] "UASG"                         
#[2] "Modalidade da Licitação"      
#[3] "Número do Aviso da Licitação" 
#[4] "Identificador da Licitação"   
#[5] "Tipo do Pregão"               
#[6] "Situação do Aviso"            
#[7] "Objeto"
#[8] "Informações Gerais"           
#[9] "Número do Processo"           
#[10] "Tipo de Recurso"              
#[11] "Número de Itens na Licitação" 
#[12] "Nome do Responsável"          
#[13] "Função do Responsável"        
#[14] "Data de Entrega do Edital"    
#[15] "Endereço de Entrega do Edital"
#[16] "Data de Abertura da Proposta" 
#[17] "Data de Entrega da Proposta"  
#[18] "Data de Publicação"           
#[19] "Itens da licitação > uri" 

materiais <- read_csv("http://compras.dados.gov.br/materiais/v1/materiais.csv")
#[1] "Código do Item"    "Descrição do Item" "Grupo"            
#[4] "Classe"            "PDM"               "Status"           
#[7] "Sustentável"  
servicos <- read_csv("http://compras.dados.gov.br/servicos/v1/servicos.csv")
#[1] "Código"         "Descrição"      "Unidade medida"
#[4] "CPC"            "Seção"          "Divisão"       
#[7] "Grupo"          "Classe"         "Subclasse"    
tpContrato <- read_csv("http://compras.dados.gov.br/contratos/v1/tipos_contrato.csv")
names(tpContrato)
#[1] "Código"    "Descrição"