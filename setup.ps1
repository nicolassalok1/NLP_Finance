#RUN CA EN AMONT :
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
#puis :
#./setup.ps1

# Arrêter en cas d’erreur
$ErrorActionPreference = "Stop"

conda deactivate
conda env remove --name FinTech_NLP
conda create --name FinTech_NLP python=3.11
conda activate FinTech_NLP

python.exe -m pip install --upgrade pip

Write-Host "Installation des dépendances Python..."
pip install -r requirements.txt

Write-Host "Téléchargement du modèle en_core_web_sm..."
python -m spacy download en_core_web_sm

Write-Host "Téléchargement du modèle en_core_web_lg..."
python -m spacy download en_core_web_lg

python -m textblob.download_corpora

Write-Host "Setup termine avec succes."