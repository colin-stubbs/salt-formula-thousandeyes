=========================
salt-formula-thousandeyes
=========================

This formula configures the ThousandEyes agent and browserbot services, based on pillar config, and ensures they're running.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``thousandeyes``
----------

Installs and configures the ThousandEyes agent and services.

``thousandeyes.browserbot``
------------------

Installs and configures the ThousandEyes browserbot agent and services.

``thousandeyes.remove``
----------------

Ensures all ThousandEyes services, config files and packages are removed.
