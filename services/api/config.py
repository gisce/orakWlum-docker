import os

from setup import basedir
from orakwlum import version

class GlobalConfig(object):
    """Default config parameters, reused at Config classes"""

    ORGANIZATION = "GISCE"

    # Base okW Mongo PARAMETERS
    MONGO_HOST = "mongodb"
    MONGO_PORT = 27017
    MONGO_DB = "oraKW"

    # Base REDIS
    REDIS_HOST = "redis"
    REDIS_PORT = 6379

    # Version
    VERSION = version.API_VERSION
    API_VERSION_PR = version.API_VERSION_PR

    # Secrets
    SECRET_KEY = "SO_MANY_SECURE"


class ProdConfig(GlobalConfig):
    """Production configuration"""

    DEVELOPMENT = False
    DEBUG = False
    DEBUG_TB_ENABLED = False
    TESTING = False
    WTF_CSRF_ENABLED = True
    PRESERVE_CONTEXT_ON_EXCEPTION = True

    # Sentry
    SENTRY_DSN = ''
    SENTRY_CONFIG = {
        'release': version.API_VERSION,
        'site': GlobalConfig.ORGANIZATION,
        'environment': 'orakWlum-API',
    }



class DevelConfig(GlobalConfig):
    """Development configuration"""

    DEVELOPMENT = False
    DEBUG = True
    DEBUG_TB_ENABLED = True
    WTF_CSRF_ENABLED = False
    PRESERVE_CONTEXT_ON_EXCEPTION = False
