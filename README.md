# Rastreador de Combate D&D (D&D Combat Tracker)

Bem-vindo ao **Rastreador de Combate D&D**! Este é um aplicativo móvel desenvolvido em Flutter para ajudar Mestres de RPG (Dungeon Masters) a gerenciar encontros de combate na 5ª Edição (e na atualização de 2024) de Dungeons & Dragons de forma rápida, eficiente e moderna.

> **Nota**: Este projeto foi desenvolvido com foco na experiência do usuário e performance, utilizando as melhores práticas de desenvolvimento mobile em Novembro de 2025.

---

## 🚀 Funcionalidades

O aplicativo oferece um conjunto completo de ferramentas para o seu jogo:

*   **⚔️ Gerenciamento de Combate**: Crie múltiplos encontros, salve-os e retome quando quiser. Nada é perdido se você fechar o app.
*   **📝 Controle de Combatentes**: Adicione Jogadores (PCs) e Monstros (NPCs) com facilidade.
*   **❤️ Rastreamento de Vida (HP)**: Ajuste a vida atual com botões rápidos (+/-) ou edite valores manualmente.
    *   *Visualização de Dano*: A barra de vida muda de cor e tamanho.
    *   *Estado de Morte*: Combatentes com 0 HP recebem um visual de caveira.
*   **🔄 Sistema de Turnos Inteligente**:
    *   **Iniciativa Automática**: A lista é ordenada automaticamente pela iniciativa.
    *   **Controle de Rodadas**: O app conta as rodadas (Rounds) automaticamente.
    *   **Destaque Ativo**: O combatente da vez é destacado com uma animação suave e brilho para fácil identificação.
*   **🌎 Internacionalização (i18n)**:
    *   Suporte completo para **Português do Brasil 🇧🇷** (Padrão).
    *   Opção de troca para **Inglês 🇺🇸** a qualquer momento.
*   **💾 Persistência de Dados**: Tudo é salvo localmente no seu dispositivo usando um banco de dados de alta performance (Isar).

---

## 🛠️ Tecnologias Utilizadas

Este projeto serve como um exemplo de arquitetura limpa e moderna em Flutter:

*   **[Flutter](https://flutter.dev/)**: Framework UI do Google para criar interfaces nativas de alta qualidade.
*   **[Riverpod](https://riverpod.dev/)**: Gerenciamento de estado robusto e reativo.
*   **[Isar Database](https://isar.dev/)**: Banco de dados NoSQL super rápido para Flutter.
*   **[Freezed & JSON Serializable](https://pub.dev/packages/freezed)**: Geração de código para imutabilidade e serialização (via build_runner).
*   **[Flutter Localizations](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization)**: Sistema nativo de tradução.

---

## 📱 Como Usar o App

O aplicativo foi desenhado para ser intuitivo. Aqui está um guia rápido:

### 1. Criando um Combate
Ao abrir o app, você verá a **Dashboard**.
1.  Toque no botão **+** (canto inferior direito).
2.  Digite um nome para o encontro (ex: "Emboscada dos Goblins").
3.  Toque em **Criar**.

### 2. Adicionando Combatentes
Toque no combate criado para entrar na tela de detalhes.
1.  Toque no botão **ADICIONAR COMBATENTE**.
2.  Preencha os dados:
    *   **Nome**: Ex: "Aragorn" ou "Goblin Arqueiro".
    *   **Iniciativa**: O valor rolado no dado d20 + modificador.
    *   **PV Máximo**: A vida total do personagem.
    *   **É Jogador?**: Marque se for um personagem de jogador (PC) para diferenciar.
3.  Toque em **Adicionar**. Repita para todos os participantes.

### 3. Gerenciando o Combate
*   **Iniciar**: O primeiro combatente da lista (maior iniciativa) já começa destacado.
*   **Avançar Turno**: Toque em **PRÓXIMO TURNO** (botão laranja) para passar a vez.
    *   Ao completar uma volta em todos os combatentes, o contador de **Rodada** (no topo) aumentará automaticamente.
*   **Dano/Cura**: Use os botões de **+** e **-** no cartão do combatente para ajustar a vida.
*   **Menu de Opções**: Toque nos três pontinhos (⋮) em qualquer cartão para **Editar** ou **Excluir** um combatente.

### 4. Trocando o Idioma
Na tela inicial (Dashboard):
1.  Toque no ícone de **Globo 🌐** na barra superior.
2.  Escolha entre **Português (Brasil)** ou **English**.

---

## 💻 Instalação e Execução (Para Desenvolvedores)

Se você é um desenvolvedor e quer rodar este projeto na sua máquina:

### Pré-requisitos
*   [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado.
*   [Git](https://git-scm.com/) instalado.

### Passo a Passo

1.  **Clone o repositório**:
    ```bash
    git clone https://github.com/seu-usuario/dnd-combat-tracker.git
    cd dnd-combat-tracker
    ```

2.  **Instale as dependências**:
    ```bash
    flutter pub get
    ```

3.  **Gere os arquivos de código** (necessário para o banco de dados e gerenciamento de estado):
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Execute o app**:
    ```bash
    flutter run
    ```

### Gerando o APK (Android)
Para instalar no seu celular Android:
1.  Conecte o celular via USB (com Depuração USB ativada).
2.  Rode o comando:
    ```bash
    flutter install
    ```
3.  Ou gere o arquivo APK para enviar para o celular:
    ```bash
    flutter build apk --release
    ```
    O arquivo estará em: `build/app/outputs/flutter-apk/app-release.apk`

---

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir *issues* reportando bugs ou sugerindo novas funcionalidades.

---

*Desenvolvido com 💜 para a comunidade de RPG.*
