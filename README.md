# 🎮 Mastermind CLI

Welcome to **Mastermind CLI**, a command-line version of the classic strategy game Mastermind. In this game, you can play as either a **Code Breaker** or a **Code Maker**, challenging yourself or letting the computer do the thinking!

## ✨ Features

- **Two Play Modes:**
  - **Code Breaker:** Crack the computer-generated code in 10 moves or less.
  - **Code Maker:** Create your own 4-digit code and let the computer try to break it in 5 moves or fewer.
- **🤖 AI-Driven Guessing:** The computer uses a sophisticated minimax algorithm inspired by Donald Knuth's method to efficiently guess the code.
- **💻 Command-Line Interface:** Simple and easy-to-use interface for an engaging experience.

## 🎮 How to Play

You can play Mastermind CLI either on Replit or locally on your machine.

### Play on Replit

[![Run on Repl.it](https://repl.it/badge/github/udbhav227/mastermind-cli)](https://replit.com/github/udbhav227/mastermind-cli)

1. **Create an Account**: Sign up on Replit to get started.
2. **Enter Name and Details**: Fill in your information to personalize your experience.
3. **Click on Import**: Import the project into your Replit account.
4. **Click on Run**: Start the game and enjoy the challenge!

> This is a one-time process. After you've played once, you can come back to your Replit account anytime and enjoy the challenge.

### Play Locally

#### Prerequisites

- **Ruby**: Ensure you have Ruby installed on your machine. You can download it from [ruby-lang.org](https://www.ruby-lang.org/en/downloads/).

#### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Udbhav227/mastermind-cli.git
   ```
2. Navigate to the project directory:

   ```bash
   cd mastermind-cli
   ```
3. Run the game

   ```bash
   ruby main.rb
   ```
## 🛠️ How It Works

### Code Breaker Mode

- The computer generates a secret 4-digit code.
- You have 10 moves to guess the code.
- After each guess, you'll receive hints to help narrow down your options.

### Code Maker Mode

- You create a 4-digit code.
- The computer uses a minimax algorithm to break your code in 5 moves or less.

## 🤝 Contributing

Contributions are welcome! If you have suggestions, bug reports, or improvements, please feel free to contribute. Here’s how you can help:

1. **Fork the Repository**: Create your own copy of the project by forking the repository.
2. **Create a Branch**: Create a new branch for your changes.
3. **Make Changes**: Implement your changes or additions.
4. **Submit a Pull Request**: Push your changes and submit a pull request with a description of what you’ve done.

If you encounter any issues or have questions, open an issue on the [GitHub repository](https://github.com/Udbhav227/mastermind-cli/issues).

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 📚 Acknowledgments

- **Donald Knuth**: For his foundational work on algorithm analysis, which inspired the AI in this project. You can read his seminal paper on the Mastermind algorithm [here](https://www.cs.uni.edu/~wallingf/teaching/cs3530/resources/knuth-mastermind.pdf).
