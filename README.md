# 💧 Befine App – Aplicación de Compra y Venta de Agua Purificada

**Befine App** es una aplicación desarrollada con Flutter para facilitar la compra, venta y gestión de productos de **Agua Purificada Befine**, permitiendo a clientes y administradores interactuar con el sistema desde dispositivos móviles de forma rápida, segura y eficiente.

Este proyecto está siendo construido con visión de producción, enfocado tanto en el aprendizaje profesional como en la creación de una solución tecnológica real para una empresa en funcionamiento.

---

## 🎯 Objetivo del Proyecto

### Técnico
- Desarrollar una **aplicación profesional y escalable en Flutter**, siguiendo buenas prácticas de desarrollo móvil (arquitectura modular, código limpio, principios SOLID).
- Implementar funcionalidades reales que conecten al usuario con servicios de compra, historial, pagos y gestión interna.

### De Negocio
- Digitalizar y modernizar el proceso de venta de agua purificada y productos relacionados.
- Ofrecer a los clientes una plataforma confiable para realizar pedidos, pagar y consultar su historial.
- Centralizar el control de stock, usuarios y pedidos para el equipo administrativo de Befine.

---

## 🧩 Funcionalidades Principales

### 👥 Para Clientes
- Registro de usuario e inicio de sesión
- Realización de pedidos (agua en bidón, dispensadores, promociones)
- Visualización de historial de compras
- Repetir pedidos anteriores con un clic
- Pago en línea a través de WebPay (u otra pasarela externa)

### 🛠️ Para Administradores
- CRUD de productos
- Seguimiento de pedidos en tiempo real
- Generación de reportes internos

### 👑 Para el Dueño (Rol Máximo)
- Todo lo anterior, más:
  - Gestión de usuarios
  - Configuración avanzada del sistema
  - Acceso a reportes completos y auditoría

---

## 🛠️ Tecnologías Utilizadas

- **Flutter** (SDK de desarrollo multiplataforma)
- **Dart** (lenguaje de programación principal)
- **Firebase / WebPay** (planificado para autenticación, base de datos y pagos)
- **VS Code** como entorno de desarrollo

---

## 🗂️ Estructura del Proyecto

```plaintext
lib/
├── screens/        # Cada pantalla principal: home, login, pedidos, etc.
│   └── home/
│       ├── home_screen.dart
│       └── widgets/
├── models/         # Clases como Pedido, Usuario, Producto
├── services/       # Lógica de negocio y conexión a datos/APIs
├── widgets/        # Componentes visuales reutilizables
├── utils/          # Helpers, validadores, constantes globales


## -------------------------------------------------------- ##
Instalación y Ejecución
1. Clonar el proyecto
bash
Copiar
Editar
git clone git@github.com:Ivan-developer-cmngsoon/befine_app.git
cd befine_app
2. Instalar dependencias
bash
Copiar
Editar
flutter pub get
3. Ejecutar la app
bash
Copiar
Editar
flutter run
🧪 Comandos para Desarrollo
bash
Copiar
Editar
flutter pub get         # Obtener dependencias
flutter run             # Ejecutar app en emulador/dispositivo
flutter build apk       # Generar APK para Android
flutter clean           # Limpiar build y archivos temporales
🌐 Enlaces
🔗 Repositorio: github.com/Ivan-developer-cmngsoon/befine_app

✍️ Autor
Iván Luis Rodríguez Pinares
Estudiante de Ingeniería en Informática (vespertino) – Duoc UC
Emprendedor y desarrollador enfocado en soluciones reales para pymes.
📧 ivanrp.informatica@gmail.com
📧 iv.rodriguezp@duocuc.cl