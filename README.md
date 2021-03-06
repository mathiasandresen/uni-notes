[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/mathiasandresen/uni-notes/Publish%20docs%20via%20GitHub%20Pages)](https://github.com/mathiasandresen/uni-notes/actions?query=workflow%3A%22Publish+docs+via+GitHub+Pages%22)
[![Website](https://img.shields.io/website?up_message=online&url=https%3A%2F%2Fnotes.mathiasandresen.dk%2F)](https://notes.mathiasandresen.dk/)

# Running Locally

1. Install Python 3.
2. Check that pip is using python3 with ``pip -V``.
    * if not, check ``pip3 -V``
3. Set up a virtual environment (steps assume that your current dir is project root) 
      1. Install virtualenv with ``pip install virtualenv``
        * else ``pip3 install virtualenv``
      2. run ``python -m venv venv``
        * else ``python3 -m venv venv``
      3. source the virtual environment
        * Linux:    ``source venv/bin/activate``
        * Windows:  ``.\venv\Scripts\activate.bat``
4. Install plugins with ``pip install -r requirements.txt`` (if pip is using python3)
    * else ``pip3 install -r requirements.txt``
5. Start local server with ``mkdocs serve``
