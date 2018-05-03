{% from "thousandeyes/map.jinja" import thousandeyes_settings with context %}

te_agent_service:
  service.dead:
    - name: {{ thousandeyes_settings.lookup.services.agent }}

te_xvfb_service:
  service.dead:
    - name: {{ thousandeyes_settings.lookup.services.xvfb }}

te_browserbot_service:
  service.dead:
    - name: {{ thousandeyes_settings.lookup.services.browserbot }}

te_browserbot_packages:
  pkg.removed:
    - pkgs: {{ thousandeyes_settings.lookup.pkgs_browserbot }}
    - require:
      - service: te_agent_service
      - service: te_xvfb_service
      - service: te_browserbot_service

te_packages:
  pkg.removed:
    - pkgs: {{ thousandeyes_settings.lookup.pkgs }}
    - require:
      - service: te_agent_service

te_agent_config:
  file.absent:
    - name: {{ thousandeyes_settings.lookup.files.agent_config }}
    - require:
      - pkg: te_packages
      - service: te_agent_service
