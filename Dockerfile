FROM tensorflow/tensorflow:latest-gpu

RUN apt-get update -y && apt-get install zip wget -y

RUN pip install --upgrade pip
RUN pip install jupyter pandas sklearn matplotlib ipympl wandb tqdm \
    RISE jupyter_contrib_nbextensions tables tensorflow_probability
RUN jupyter contrib nbextension install --system

COPY ./notebooks /app/notebooks

WORKDIR /app/notebooks

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", \
     "--ip=0.0.0.0", "--allow-root"]
