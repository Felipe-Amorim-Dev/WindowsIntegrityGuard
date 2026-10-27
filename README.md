# Windows Integrity Guard

Projeto pessoal em .NET para verificar a integridade de componentes importantes do Windows e, quando autorizado, conduzir um processo de reparo controlado.

**Estado atual:** protótipo em desenvolvimento. A existência de testes de unidade não significa que o serviço esteja validado para reparar computadores em uso.

## Componentes

```text
WindowsIntegrityGuard (este repositório)
├── service/ -> WindowsIntegrityGuard-Service
│   ├── Core: regras e contratos
│   ├── Service: execução e integração com Windows
│   └── Tests: testes automatizados
└── ui/ -> WindowsIntegrityGuard-UI
    └── interface Windows em WPF
```

A UI apresenta as informações ao usuário; a lógica de validação e reparo fica no serviço. A integração completa entre os componentes ainda precisa de testes em Windows.

## Preparar o ambiente

É necessário Windows 10/11, Visual Studio com desenvolvimento desktop .NET e SDK .NET compatível com os projetos. Use:

```powershell
git clone --recurse-submodules https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard.git
cd WindowsIntegrityGuard
git submodule update --init --recursive
```

Abra a solução em `service/WindowsIntegrityGuard/WindowsIntegrityGuard.sln` para compilar e testar o serviço. Para a interface, consulte o arquivo de projeto disponível em `ui/WindowsIntegrityGuard.UI`.

## Fluxo previsto

```text
Solicitação do usuário
      ↓
Verificação de integridade
      ↓
Análise do resultado
      ↓
Se houver corrupção e houver autorização explícita:
  executar recuperação controlada (SFC/DISM)
      ↓
Nova verificação e apresentação do resultado
```

Os detalhes de instalação do serviço, permissões, comunicação UI/Service e recuperação de falhas continuam em revisão. Não executar em máquinas críticas nem automatizar SFC/DISM em produção sem ensaios em VM e backup.

## Desenvolvimento

O [serviço](https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard-Service) tem CI com compilação e testes. Veja o [resultado atual do workflow](https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard-Service/actions/workflows/ci.yml). A [UI](https://github.com/Felipe-Amorim-Dev/WindowsIntegrityGuard-UI) ainda requer avaliação conjunta com o serviço.

Próximas etapas: integração completa, logs operacionais, empacotamento, validação de permissões, cenários de falha e testes em máquinas virtuais.
