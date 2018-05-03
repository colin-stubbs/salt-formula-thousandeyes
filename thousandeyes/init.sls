{% from "thousandeyes/map.jinja" import thousandeyes_settings with context %}

te_packages:
  pkg.installed:
    - pkgs: {{ thousandeyes_settings.lookup.pkgs }}

te_agent_config:
  file.managed:
    - name: {{ thousandeyes_settings.lookup.files.agent_config }}
    - source: salt://thousandeyes/files/te-agent.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 0644
    - require:
      - pkg: te_packages
    - context:
      config_avps: {{ thousandeyes_settings.agent.config }}

te_agent_service:
  service.running:
    - name: {{ thousandeyes_settings.lookup.services.agent }}
    - enable: True
    - watch:
      - file: te_agent_config
      - pkg: te_packages
    - require:
      - pkg: te_packages
      - file: te_agent_config
