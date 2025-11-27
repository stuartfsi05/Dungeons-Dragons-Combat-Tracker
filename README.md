# 🐉 Rastreador de Combate D&D (D&D Combat Tracker)

Bem-vindo ao **Rastreador de Combate D&D**! Este é o seu assistente digital definitivo para gerenciar encontros de RPG (Dungeons & Dragons 5e e 2024).

Desenvolvido para ser **rápido**, **intuitivo** e **bonito**, ele permite que você foque na narrativa enquanto o app cuida da matemática e da ordem dos turnos.

---

## ✨ Funcionalidades Principais

*   **Gerenciamento de Iniciativa**: Ordenação automática de turnos baseada na rolagem de dados.
*   **Controle de Vida (HP)**:
    *   Dano e Cura rápidos.
    *   **Sistema de HP Temporário**: O dano é descontado primeiro do HP Temporário (Escudo) antes de afetar a vida real.
*   **Condições e Status**: Adicione etiquetas coloridas (ex: *Envenenado*, *Invisível*) para não esquecer nada.
*   **Visualização Clara**:
    *   **CA (Classe de Armadura)** sempre visível.
    *   Diferenciação visual entre **Jogadores** (ícone de pessoa) e **Inimigos** (ícone de robô/monstro).
    *   Indicador de **Turno Ativo** com borda brilhante.
*   **Temas**: Alterne entre **Modo Claro** e **Modo Escuro** para maior conforto visual.
*   **Ícone Personalizado**: Gatinho com D20 para dar sorte nas rolagens! 🐱🎲

---

## 📖 Guia do Mestre (Como Usar)

### 1. Criando um Combate
1.  Na tela inicial, toque no botão **+**.
2.  Dê um nome para o encontro (ex: *"Emboscada na Floresta"*).
3.  Toque em **Criar**.

### 2. Adicionando Combatentes
Dentro do combate, toque em **ADICIONAR** (botão azul) para incluir participantes:
*   **Nome**: Identificação do personagem ou monstro.
*   **Iniciativa**: Valor total da rolagem de iniciativa.
*   **CA (Classe de Armadura)**: A defesa do alvo.
*   **PV Máximo**: Pontos de vida totais.
*   **HP Temp**: (Opcional) Pontos de vida temporários iniciais.
*   **É Jogador?**: Marque se for um PC (Player Character).

### 3. Durante o Combate (A Ficha do Personagem)
Cada combatente é representado por um cartão com várias informações e controles:

#### **Esquerda (Status)**
*   **Círculo Colorido**: Mostra o valor da **Iniciativa**.
*   **CA**: Logo abaixo, mostra a Classe de Armadura.
*   **Ícone**: Indica se é Jogador (Pessoa) ou Inimigo (Robô).

#### **Centro (Informações)**
*   **Nome**: Nome do combatente.
*   **Barra de Vida**: Verde (saudável) ou Vermelha (morto).
*   **Etiquetas**:
    *   **Escudo Azul (+TP)**: Indica quanto HP Temporário o alvo tem.
    *   **Etiqueta Verde-Água**: Mostra as condições ativas (ex: *Surdo*, *Cego*).

#### **Direita (Controles)**
Aqui você tem o controle total com botões organizados:

1.  **Controle de Vida (Círculos)**:
    *   🔴 **Botão Menos (-)**: Causa dano.
    *   🟢 **Botão Mais (+)**: Cura.
    *   **Caixa de Texto**: Digite o valor aqui antes de clicar no + ou -.
    *   *Dica: Se o alvo tiver HP Temporário, o dano será descontado dele primeiro automaticamente!*

2.  **Ações Rápidas (Ícones)**:
    *   🛡️ **Escudo Azul**: Abre uma janela rápida para adicionar/remover **HP Temporário**.
    *   🏷️ **Etiqueta Verde**: Abre uma janela rápida para adicionar/remover **Condições**.

3.  **Menu (Três Pontos)**:
    *   Opções para **Editar** a ficha completa ou **Remover** o combatente.

### 4. Gerenciando Turnos
*   O combatente da vez fica com uma **borda colorida brilhante**.
*   Ao terminar o turno, clique no botão laranja **PRÓXIMO TURNO**.
*   O app avança para o próximo da lista e conta as rodadas automaticamente.
*   *Nota: Combatentes com 0 HP são pulados automaticamente.*

---

## 📲 Como Instalar (Android)

Este aplicativo é distribuído via arquivo **APK** (instalação manual).

1.  Receba o arquivo `app-release.apk`.
2.  Toque no arquivo para abrir.
3.  Se o celular perguntar, permita a instalação de **Fontes Desconhecidas**.
4.  Toque em **Instalar**.
5.  Procure pelo ícone do **Gatinho com D20** e divirta-se!

---

## 🛠️ Para Desenvolvedores

### Gerar APK de Release
Para gerar uma nova versão do instalador:
```bash
flutter build apk --release --no-tree-shake-icons
```
O arquivo será gerado em: `build/app/outputs/flutter-apk/app-release.apk`

### Tecnologias
*   **Flutter** (UI Toolkit)
*   **Riverpod** (Gerenciamento de Estado)
*   **Isar** (Banco de Dados Local)
*   **Google Fonts** (Tipografia)

---

*Que os dados rolem sempre a seu favor! (Ou não, sou o Mestre afinal... 😈)*
