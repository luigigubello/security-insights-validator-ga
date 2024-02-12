FROM python:3.11-bullseye

LABEL com.github.actions.name="SECURITY-INSIGHTS Validator" \
      com.github.actions.description="Run SECURITY-INSIGHTS validator (ossf/si-tooling) as GitHub Action workflow."

COPY requirements.txt /requirements.txt

COPY si-validator.py /si-validator.py

COPY output.py /output.py

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x si-validator.py

RUN chmod +x /output.py

RUN chmod +x /entrypoint.sh

RUN pip install -r requirements.txt

RUN ln --symbolic /si-validator.py /usr/bin/si-validator

RUN ln --symbolic /output.py /usr/bin/output

ENTRYPOINT ["/entrypoint.sh"]