# Servidor local — instruções

Arquivos adicionados:

- `serve.ps1` — script PowerShell para iniciar um servidor estático (usa Python 3/2 ou npx http-server)
- `serve.bat` — script para Windows (cmd) com a mesma finalidade

Opções para iniciar um servidor estático rapidamente:

1) Usando o script PowerShell (recomendado no Windows PowerShell):

```powershell
.\serve.ps1 -Port 8000
```

2) Usando o script batch (cmd.exe):

```bat
serve.bat 8000
```

3) Usando Python (manual):

Python 3:

```powershell
python -m http.server 8000
```

Python 2:

```powershell
python -m SimpleHTTPServer 8000
```

4) Usando Node (manual):

Se tiver Node.js instalado, instale `http-server` globalmente ou use npx:

```powershell
npx http-server -p 8000
# ou
npm install -g http-server
http-server -p 8000
```

Notas:

- Os scripts tentam automaticamente escolher Python 3, Python 2 ou `npx` conforme disponível.
- Se não há Python nem Node, instale um deles. Python 3 é suficiente para um servidor estático simples.
