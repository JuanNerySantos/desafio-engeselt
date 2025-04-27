# Doce Hub🎂

É um software que visa conectar, de forma rápida e prática, confeitarias e clientes. Através do aplicativo, é possível localizar confeitarias registradas em todo o país. A Doce Hub permite que as confeitarias cadastrem seus produtos, com a possibilidade de alterar os produtos e as informações do próprio estabelecimento.

## 🚀 Tecnologias

- Flutter
- Dart
- Drift
- geocoding

## Como Startar o projeto

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/JuanNerySantos/desafio-engeselt.git

   ```

2. **Entre na pasta do projeto**:

   ```bash
   cd desafio-engeselt

   ```

3. **Instale as dependências**:

   ```bash
   flutter pub get
   ```

4. **Crie o arquivo .g.dart**:

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

## Configurações específicas para Android/iOS

### Android

```bash
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

### IOS

```bash
<key>NSLocationWhenInUseUsageDescription</key>
<string>Precisamos da sua localização para mostrar no mapa.</string>

<key>NSLocationAlwaysUsageDescription</key>
<string>Precisamos da sua localização para funcionalidades contínuas.</string>

<key>NSLocationWhenInUseUsageDescription</key>
<string>Precisamos da sua localização para mostrar no mapa.</string>

<key>NSLocationAlwaysUsageDescription</key>
<string>Precisamos da sua localização para funcionalidades em segundo plano.</string>
```

## Após tudo configurado

**É só da o start no projeto**

```bash
 flutter run
```

## Estutura do projeto

**pages** - Todas as paginas que o usuario vai ver

**ui/components** - Todos os botões e componentes com estilo aplicado

**data** - Tabelas e configurações do banco de dados

**repository** - Toda alteração no banco de dados só é feito atarvés do repository

**service** - Estão as regras de négocios

# Para qualquer dúvida estou a disposição

juannnerysantos@gmail.com
