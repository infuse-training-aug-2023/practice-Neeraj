FROM python:3.8
RUN pip install numpy

# Install numpy and Pillow (PIL)
RUN pip install numpy Pillow

COPY . /app
WORKDIR /app
CMD ["python","exercise1.py","6.0"]