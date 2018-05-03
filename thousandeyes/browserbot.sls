{% from "thousandeyes/map.jinja" import thousandeyes_settings with context %}

include:
  - thousandeyes

te_browserbot_packages:
  pkg.installed:
    - pkgs: {{ thousandeyes_settings.lookup.pkgs_browserbot }}

te_xvfb_service:
  service.running:
    - name: {{ thousandeyes_settings.lookup.services.xvfb }}
    - enable: True
    - require:
      - pkg: te_packages
      - pkg: te_browserbot_packages

te_browserbot_service:
  service.running:
    - name: {{ thousandeyes_settings.lookup.services.browserbot }}
    - enable: True
    - require:
      - pkg: te_packages
      - pkg: te_browserbot_packages
      - service: te_xvfb_service
