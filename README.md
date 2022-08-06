# Atividades Aula 04 Curso LIFT Learning

Resolução das atividades da Aula 04 para quem quiser acompanhar no Discord

Requisitos:

- Instalar NodeJS com NPM - https://nodejs.org/en/download/
- Instalar Visual Studio Code - https://code.visualstudio.com/download
- Instalar pacotes do NPM:

```bash
npm i
```

Se você já possui essas instalação passe para a Etapa HarHat caso queira fazer o passo a passo, caso não, basta Clonar o Respositório e prosseguir.


## HardHat

Para instalar o HardHat:

- Primeiramente crie um diretório com o comando abaixo:

```bash
mkdir lift-aula04
```

- Acesse o diretório com esse comando:

```bash
cd lift-aula04
```

- Para iniciar seu projeto e instalar o HardHat digite:

```bash
npm init -y npm install --save-dev hardhat
```

Para iniciar seu projeto HardHat:

```bash
npx hardhat 
```
**// No terminal de Y (sim) para tudo e Escolha a opção Create an empty hardhat.config.js, assim criaremos o projeto do zero.**



Fazendo mais algumas instalações necessárias:

- Faça essas instalações para garantir que não falte nada durante a execução dos contratos:

```bash
npm install --save-dev @nomiclabs/hardhat-ethers dotenv ethers @nomiclabs/hardhat-ethers @nomiclabs/hardhat-etherscan chai @nomicfoundation/hardhat-toolbox
```

- Instale a bibliotecas de Contratos da OpenZeppelin:

```bash
npm install @openzeppelin/contracts 
```




Agora iremos para a parte de configuração e inicio de arquivos necessários:

- Copie o arquivo hardhat.config.js **// Utilizei a rede Mainnet da Polygon se for fazer na rede Mumbai será necessário modificar networks:**

- Crie o um arquivo chamado .env **// Aqui é onde colocaremos todas suas APIs secretas e sua Secret Key. Utilizei a Infura para servir o Nó**

- Crie uma pasta chamada test e dentro copie o arquivo Token.js

- Crie uma pasta chamda scripts e dentro copie o aquivo deploy.js

- Crie uma pasta chamada contracts e copie todos os contratos Tarefa01.sol, Tarefa02.sol, Tarefa03.sol, Tarefa04.sol e SellerTarefa04.sol



Pronto agora vamos para a etapa dos Contratos.

## SmartContracts

Agora para cada contrato que você executar altere em Token.js e deploy.js
**// getContractFactory("Nome do Contrato Ex: Tarefa01");**

Depois siga essa sequência para cada contrato.

- Compile:

```bash
npx hardhat compile 
```

- Test:

```bash
npx hardhat test
```

- Deploy em Rede Local:

```bash
npx hardhat run scripts/deploy.js
```

- Deploy na Polygon Mainnet:

```bash
npx hardhat run scripts/deploy.js --network matic 
```

- Verificar o contrato na Polygon Scan:

```bash
npx hardhat verify --network matic "Endereço do Contrato que foi gerado acima" --contract contracts/Tarefa01.sol:Tarefa01 "Contrato que você vai verificar"
```

Esse processo serve para todos os 4 contratos. Apenas o SellerTarefa04 que é o contrato para vender o token da Tarefa04 que precisamos fazer outro processo que vou deixar para a aula


Espero que esse tutorial tenha ajudado quem estava com mais dificuldades, e outra questão é a forma da resolução dos contratos solicitados pelo professor.
Existem inúmeras maneiras de se criar as funções que foram exigidas, então nada garante que essas que passei são as melhores, são as corretas ou não estão sujeitas à algum ataque.


