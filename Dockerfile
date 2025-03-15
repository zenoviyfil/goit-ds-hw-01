# Використовуємо офіційний образ Python
FROM python:3.12

# Встановлюємо робочу директорію всередині контейнера
WORKDIR /app

# Копіюємо всі файли проєкту у контейнер
COPY . .

# Перевіримо структуру файлів після копіювання
RUN echo "Файли в контейнері:" && ls -R /app

# Встановлюємо Poetry
RUN pip install --upgrade pip && pip install poetry

# Встановлюємо залежності через poetry
WORKDIR /app/assistant/src/assistant
RUN poetry install

# Визначаємо команду запуску CLI-застосунку
ENTRYPOINT ["poetry", "run", "python", "assistant.py"]
