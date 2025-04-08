- [Terraform Azure DevOps Project Module](#terraform-azure-devops-project-module)
  - [Requisitos](#requisitos)
  - [Estrutura do Projeto](#estrutura-do-projeto)
  - [Como Executar o Terraform](#como-executar-o-terraform)
    - [Passo 1: Preparar o Ambiente](#passo-1-preparar-o-ambiente)
    - [Passo 2: Configurar o Terraform](#passo-2-configurar-o-terraform)
    - [Passo 3: Inicializar o Terraform](#passo-3-inicializar-o-terraform)
    - [Passo 4: Verificar o Plano](#passo-4-verificar-o-plano)
    - [Passo 5: Aplicar o Plano](#passo-5-aplicar-o-plano)
    - [Passo 6: Verificar o Projeto Criado](#passo-6-verificar-o-projeto-criado)
    - [Passo 7: Limpar os Recursos](#passo-7-limpar-os-recursos)
  - [Exemplo de Uso do Módulo](#exemplo-de-uso-do-módulo)
  - [Parâmetros](#parâmetros)
    - [`project_name` (Requerido)](#project_name-requerido)
    - [`project_description` (Requerido)](#project_description-requerido)
    - [`project_type` (Opcional)](#project_type-opcional)
    - [`project_visibility` (Opcional)](#project_visibility-opcional)
    - [`features` (Opcional)](#features-opcional)
  - [Licença](#licença)

---

# Terraform Azure DevOps Project Module

Este módulo Terraform permite provisionar um projeto no Azure DevOps. Você pode especificar parâmetros como nome, descrição, tipo de processo (Agile, Scrum, etc.), visibilidade (público ou privado) e configurar funcionalidades específicas usando flags.

## Requisitos

Antes de começar, verifique se você tem as seguintes ferramentas instaladas:

- [Terraform](https://www.terraform.io/downloads.html)
- Conta no Azure DevOps com permissões para criar projetos.
- [Azure DevOps Personal Access Token (PAT)](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate)

## Estrutura do Projeto

```
/terraform-azure-devops-project
├── main.tf              # Arquivo principal do módulo
├── variables.tf         # Arquivo de variáveis
├── outputs.tf           # Arquivo de saídas
├── README.md            # Este arquivo
```

## Como Executar o Terraform

Siga os passos abaixo para configurar e aplicar o Terraform para provisionar um projeto no Azure DevOps.

### Passo 1: Preparar o Ambiente

1. **Clone o Repositório**

   Se você ainda não tem o código do módulo, faça o clone ou baixe o repositório.

   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd terraform-azure-devops-project
   ```

2. **Configurar o Terraform**

   Certifique-se de que o Terraform esteja instalado e funcionando em sua máquina. Você pode verificar isso executando o comando:

   ```bash
   terraform --version
   ```

3. **Autenticar com o Azure DevOps**

   O Terraform precisa se autenticar com o Azure DevOps para criar o projeto. Você pode fazer isso usando um **Personal Access Token (PAT)**.

   Defina a variável de ambiente `AZDO_PERSONAL_ACCESS_TOKEN` com o seu token de acesso pessoal:

   ```bash
   export AZDO_PERSONAL_ACCESS_TOKEN="seu_token_aqui"
   ```

   **Alternativa**: Se você preferir, pode configurar a autenticação no arquivo de configuração `provider` do Terraform.

### Passo 2: Configurar o Terraform

1. **Criar um arquivo `terraform.tfvars`**

   É uma boa prática usar um arquivo `terraform.tfvars` para passar os valores das variáveis. Crie um arquivo `terraform.tfvars` na raiz do projeto:

   ```bash
   touch terraform.tfvars
   ```

   Adicione o seguinte conteúdo ao arquivo `terraform.tfvars`:

   ```hcl
   project_name        = "MeuNovoProjeto"
   project_description = "Descrição do meu novo projeto"
   project_type        = "Agile"
   project_visibility  = "Private"
   features = {
     testplans  = "enabled"
     artifacts = "disabled"
   }
   ```

   Você pode ajustar os valores conforme necessário.

2. **Variáveis e Personalização**

   Se você preferir não usar um arquivo `terraform.tfvars`, você pode passar as variáveis diretamente quando for executar o Terraform ou configurar o arquivo `variables.tf` com os valores desejados.

### Passo 3: Inicializar o Terraform

Execute o comando `terraform init` para inicializar o ambiente Terraform e baixar os provedores necessários.

```bash
terraform init
```

### Passo 4: Verificar o Plano

Execute o comando `terraform plan` para visualizar as ações que o Terraform executará. Isso ajudará a garantir que o Terraform está configurado corretamente e que você está criando o projeto conforme esperado.

```bash
terraform plan
```

### Passo 5: Aplicar o Plano

Após revisar o plano, execute o comando `terraform apply` para criar o projeto no Azure DevOps.

```bash
terraform apply
```

O Terraform solicitará uma confirmação antes de aplicar as mudanças. Digite `yes` para continuar.

### Passo 6: Verificar o Projeto Criado

Após a execução do `terraform apply`, o projeto será criado no Azure DevOps com as características especificadas. Você pode verificar o projeto diretamente no Azure DevOps.

### Passo 7: Limpar os Recursos

Se você quiser destruir os recursos provisionados, execute o comando `terraform destroy`:

```bash
terraform destroy
```

Isso removerá o projeto do Azure DevOps.

## Exemplo de Uso do Módulo

Aqui está um exemplo de como usar este módulo em um arquivo de configuração principal (por exemplo, `main.tf`):

```hcl
module "azure_devops_project" {
  source              = "./modules/azure_devops_project"  # Caminho para o módulo
  project_name        = "MeuNovoProjeto"
  project_description = "Descrição do meu novo projeto"
  project_type        = "Agile"
  project_visibility  = "Private"
  features = {
    testplans  = "enabled"
    artifacts = "disabled"
  }
}
```

## Parâmetros

### `project_name` (Requerido)

- **Descrição**: O nome do projeto no Azure DevOps.
- **Tipo**: `string`

### `project_description` (Requerido)

- **Descrição**: A descrição do projeto.
- **Tipo**: `string`

### `project_type` (Opcional)

- **Descrição**: O tipo de processo do projeto (Agile, Scrum, etc.).
- **Tipo**: `string` (default: "Agile")

### `project_visibility` (Opcional)

- **Descrição**: Define a visibilidade do projeto. Pode ser `Private` ou `Public`.
- **Tipo**: `string` (default: "Private")

### `features` (Opcional)

- **Descrição**: Um mapa de funcionalidades a serem habilitadas ou desabilitadas. Exemplo de map:
  
```hcl
features = {
  testplans  = "enabled"
  artifacts = "disabled"
}
```

- **Tipo**: `map(string)` (default: `{"testplans" = "disabled", "artifacts" = "disabled"}`)

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

Este `README.md` fornece uma documentação clara e direta sobre como usar o módulo Terraform para criar um projeto no Azure DevOps, configurar variáveis, e aplicar o plano. Se precisar de mais detalhes ou ajuda com outro aspecto do Terraform, fique à vontade para perguntar!