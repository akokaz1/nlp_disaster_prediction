# Start from a core stack version
FROM jupyter/scipy-notebook

RUN conda install -c conda-forge sparse_dot_topn
RUN conda install -c conda-forge shap

USER root
RUN apt-get update
RUN sudo apt-get install graphviz -y

USER jovyan
ADD ./requirements.txt /home/jovyan/requirements.txt
RUN pip install -r /home/jovyan/requirements.txt

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter labextension install @jupyterlab/toc


