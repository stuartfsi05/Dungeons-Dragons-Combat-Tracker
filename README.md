# Rastreador de Combate D&D (D&D Combat Tracker)

Bem-vindo ao **Rastreador de Combate D&D**! Este é um aplicativo móvel desenvolvido em Flutter para ajudar Mestres de RPG (Dungeon Masters) a gerenciar encontros de combate na 5ª Edição (e na atualização de 2024) de Dungeons & Dragons de forma rápida, eficiente e moderna.

> **Nota**: Este projeto foi desenvolvido com foco na experiência do usuário e performance, utilizando as melhores práticas de desenvolvimento mobile em Novembro de 2025.

---

## � Guia para Mestres (Como Usar)

Este aplicativo é o seu escudo de mestre digital. Veja como é simples:

### 1. Criando um Combate
*   Abra o app e clique no botão **+** no canto inferior.
*   Dê um nome épico para a batalha (ex: *"A Toca do Dragão"*).
*   Clique em **Criar**. Pronto, sua mesa está montada!

### 2. Adicionando os Participantes
Toque no nome do combate que você acabou de criar.
*   Clique no botão laranja **ADICIONAR COMBATENTE**.
*   Preencha a ficha rápida:
    *   **Nome**: Quem é? (ex: *"Gandalf"* ou *"Goblin 1"*).
    *   **Iniciativa**: Quanto tirou no dado d20? O app organiza a ordem sozinho!
    *   **PV Máximo**: Quanta vida ele tem?
    *   **É Jogador?**: Marque essa caixa se for um herói (PC). Se for monstro, deixe desmarcado.
*   Repita para todos.

### 3. Hora da Ação!
*   **Quem joga agora?**: O personagem com a borda **Brilhante** e colorida é o ativo.
*   **Passar a vez**: O turno acabou? Clique em **PRÓXIMO TURNO** (botão laranja). O app pula para o próximo e conta as rodadas automaticamente.
*   **Levou Dano?**:
    *   Use o botão **-** para tirar vida.
    *   Use o botão **+** para curar.
    *   Se a vida chegar a zero, uma **Caveira** aparece. 💀

### 4. Personalize
*   **Modo Escuro/Claro**: Clique no Sol/Lua no topo para descansar os olhos.
*   **Idioma**: Clique no Globo 🌐 para mudar entre Português e Inglês.

---

## � Como Instalar no Android (Passo a Passo)

> **Nota**: Este aplicativo não está na Play Store. Você vai instalar o arquivo direto no seu celular (isso se chama *Sideload*).

### Passo 1: Baixar o Aplicativo
Peça para o desenvolvedor (ou quem te enviou este link) o arquivo **APK** do jogo.
*   O arquivo geralmente se chama `app-release.apk`.

### Passo 2: Instalar
1.  Baixe o arquivo no seu celular.
2.  Toque nele para abrir.
3.  O celular pode perguntar: *"Deseja instalar apps desta fonte?"*.
    *   Responda **Sim** ou **Permitir**.
4.  Toque em **Instalar**.
5.  Pronto! O ícone do **D&D Combat Tracker** vai aparecer na sua tela inicial.

---

## 💻 Para Desenvolvedores (Gerar o Instalador)

Se você é quem está criando o app e quer mandar para seus amigos:

### Pré-requisitos
*   Ter o [Flutter](https://flutter.dev/) instalado no seu computador.

### Como Gerar o APK (Arquivo de Instalação)
1.  Abra o terminal na pasta do projeto.
2.  Rode este comando:
    ```bash
    flutter build apk --release
    ```
3.  O computador vai pensar um pouco e criar o arquivo.
4.  Você encontrará o arquivo mágico aqui:
    `build/app/outputs/flutter-apk/app-release.apk`
5.  **Envie este arquivo** para o celular via WhatsApp, Google Drive ou USB.

---

## 🛠️ Tecnologias (Para Curiosos)
*   Feito com **Flutter** (Google).
*   Banco de dados **Isar** (Super rápido).
*   Gerenciamento de estado **Riverpod**.

---

*Boas rolagens! 🎲*
