import os, sys
from pathlib import Path
from datetime import datetime
ROOT = Path(__file__)

def robot_local_exe():
    now = datetime.now()
    CURRENT_TIME = now.strftime("%d-%m-%y_%H-%M-%S")
    ROOT = Path(__file__).parent
    
    os.system(f"echo ==============================================================================")
    os.system(f"echo DADOS DA EXECUÇÃO")
    os.system(f"echo ==============================================================================")
    os.system(f"echo Sessão: LOCAL")
    os.system(f"echo {ROOT}")
    os.system(f"robot -L trace -d results/{CURRENT_TIME}/logs -v CURRENT_TIME:{CURRENT_TIME} -v ROOT:{ROOT} suites")

robot_local_exe()