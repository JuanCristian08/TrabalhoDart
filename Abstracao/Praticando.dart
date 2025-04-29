// Classe abstrata: define o que uma ContaBancaria deve ter
abstract class ContaBancaria {
  double saldo = 0;

  // Método abstrato: cada tipo de conta implementa seu próprio saque
  void sacar(double valor);

  // Método comum: comportamento padrão
  void depositar(double valor) {
    saldo += valor;
    print('Depósito de R\$${valor.toStringAsFixed(2)} realizado.');
  }

  // Método abstrato: usado para contas que rendem juros (como poupança)
  void aplicarRendimento();
}

// Classe concreta: Conta Corrente
class ContaCorrente extends ContaBancaria {
  final double tarifaSaque = 2.5;

  @override
  void sacar(double valor) {
    if (saldo >= (valor + tarifaSaque)) {
      saldo -= (valor + tarifaSaque);
      print('Saque de R\$${valor.toStringAsFixed(2)} realizado com tarifa de R\$${tarifaSaque.toStringAsFixed(2)}.');
    } else {
      print('Saldo insuficiente.');
    }
  }

  @override
  void aplicarRendimento() {
    print('Conta Corrente não possui rendimento automático.');
  }
}

// Classe concreta: Conta Poupança
class ContaPoupanca extends ContaBancaria {
  final double taxaRendimento = 0.03; // 3% ao mês

  @override
  void sacar(double valor) {
    if (saldo >= valor) {
      saldo -= valor;
      print('Saque de R\$${valor.toStringAsFixed(2)} realizado.');
    } else {
      print('Saldo insuficiente.');
    }
  }

  @override
  void aplicarRendimento() {
    double rendimento = saldo * taxaRendimento;
    saldo += rendimento;
    print('Rendimento de R\$${rendimento.toStringAsFixed(2)} aplicado.');
  }
}

// Função principal do programa
void main() {
  // Trabalhando com abstração: usamos o tipo ContaBancaria
  ContaBancaria conta1 = ContaCorrente();
  ContaBancaria conta2 = ContaPoupanca();

  // Operações com conta corrente
  print('\n--- Conta Corrente ---');
  conta1.depositar(100);
  conta1.sacar(50);
  conta1.aplicarRendimento();
  print('Saldo final: R\$${conta1.saldo.toStringAsFixed(2)}');

  // Operações com conta poupança
  print('\n--- Conta Poupança ---');
  conta2.depositar(200);
  conta2.aplicarRendimento();
  conta2.sacar(50);
  print('Saldo final: R\$${conta2.saldo.toStringAsFixed(2)}');
}
