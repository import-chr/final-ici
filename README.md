# Proyecto de Investigación

Este proyecto está diseñado para gestionar el control de versiones de mi proyecto de investigación, utilizando LaTeX para generar un documento académico profesional. Incluye la configuración necesaria para compilar el proyecto y administrar sus recursos.

## Tabla de Contenidos
1. [Descripción](#descripción)
2. [Requisitos](#requisitos)
3. [Estructura del Proyecto](#estructura-del-proyecto)
4. [Recursos en la Nube](#recursos-en-la-nube)
5. [Instrucciones de Compilación](#instrucciones-de-compilación)
   - [Configuración de LaTeX Workshop en VS Code](#configuración-de-latex-workshop-en-vs-code)
   - [Compilación Manual](#compilación-manual)
6. [Ejemplo de Código LaTeX](#ejemplo-de-código-latex)
7. [Licencia](#licencia)

---

## Descripción
Este repositorio contiene los archivos necesarios para compilar mi proyecto de investigación. Está dirigido principalmente a estudiantes que trabajan en proyectos académicos similares.

El documento principal, `thesis.tex`, genera un archivo PDF llamado `thesis.pdf` tras ser compilado con **XeLaTeX**.

---

## Requisitos
1. **Herramientas necesarias:**
   - [XeLaTeX](https://www.latex-project.org/get/): Instalado como parte de TeX Live o MikTeX.
   - [Visual Studio Code](https://code.visualstudio.com/): Como editor de texto con la extensión **LaTeX Workshop** instalada.

---

## Estructura General del Proyecto

```
project/
├── thesis.tex          # Documento principal de LaTeX
├── build/              # Carpeta de salida de compilación
├── sections/           # Archivos de secciones del documento
│   ├── capitulos/      # Capítulos de la tesis
│   ├── indices/
│   ├── oficios/        # No accesibles
│   ├── secciones.tex
├── images/             # Imágenes del proyecto
│   ├── imagenes.png
├── .latexmkrc          # Configuración de latexmk para XeLaTeX
├── README.md
```

---

## Recursos en la Nube

Los recursos visuales del proyecto, como imágenes y gráficos generados, están disponibles en la nube. Descárgalos desde el siguiente enlace:

[**Google Drive - Imágenes del Proyecto**](https://drive.google.com/)

Descarga las imágenes y colócalas en la carpeta `images/`.

---

## Instrucciones de Compilación

### Configuración de LaTeX Workshop en VS Code
1. Instala la extensión [**LaTeX Workshop**](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) en **Visual Studio Code**.
2. Abre el archivo de configuración de usuario (`settings.json`) en VS Code.
3. Agrega las siguientes configuraciones para usar **XeLaTeX** y guardar los archivos de salida en la carpeta `build/`:

```json
"latex-workshop.latex.recipes": [
  {
    "name": "xelatex -> makeglossaries -> xelatex*2",
    "tools": ["xelatex", "makeglossaries", "xelatex", "xelatex"]
  }
],

"latex-workshop.latex.tools": [
  {
    "name": "xelatex",
    "command": "latexmk",
    "args": [
      "-xelatex",
      "-synctex=1",
      "-interaction=nonstopmode",
      "-file-line-error",
      "-halt-on-error",
      "-f",
      "-output-directory=build",
      "%DOC%"
    ]
  },

  {
    "name": "makeglossaries",
    "command": "makeglossaries",
    "args": [
      "-d", "build",
      "%DOCFILE%"
    ],
  }
],

"latex-workshop.view.pdf.viewer": "tab",
"latex-workshop.latex.autoBuild.run": "onSave"
```

### Compilación Manual
1. Abre un terminal en el directorio raíz del proyecto.
2. Ejecuta el siguiente comando para compilar el proyecto:
   ```bash
   xelatex -interaction=nonstopmode -output-directory=build thesis.tex
   ```
3. El archivo PDF generado se encontrará en la carpeta `build/` con el nombre `thesis.pdf`.

### Configuración de `.latexmkrc`
Para automatizar la compilación con `latexmk` y asegurarte de que use XeLaTeX, crea un archivo `.latexmkrc` en la raíz del proyecto con el siguiente contenido:

```perl
$out_dir = "build";
$pdflatex = "xelatex -synctex=1 -interaction=nonstopmode";
$pdf_mode = 5;

@generated_exts = qw(aux bbl blg fdb_latexmk fls log nav out snm toc synctex.gz);
```

Ahora puedes compilar el proyecto con `latexmk` simplemente ejecutando:
```bash
latexmk
```
Esto garantizará que se utilice **XeLaTeX** sin necesidad de especificarlo manualmente cada vez.

---

## Licencia

Este proyecto está licenciado bajo una licencia **restrictiva**. Se permite únicamente la modificación de la plantilla (estructura y formato del documento) y no del contenido del mismo. No se permite el uso del contenido del documento con fines comerciales o de distribución sin autorización explícita del autor.

### Texto de la Licencia:
```
Restricted License

Copyright (c) [2025] [Christian Loeza]

Permission is hereby granted to use and modify the LaTeX template (structure and formatting) provided in this repository for personal or academic purposes. Modification or distribution of the document's content is strictly prohibited without prior written consent from the author.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

---

## Notas
Actualmente, este proyecto no acepta contribuciones externas, ya que está diseñado específicamente para mi investigación de tesis.

---

[@import-chr](https://github.com/import-chr)