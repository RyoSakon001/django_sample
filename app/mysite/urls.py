from django.contrib import admin
from django.urls import include, path
from debug_toolbar.toolbar import debug_toolbar_urls
from django.conf import settings

urlpatterns = [
    path("polls/", include("polls.urls")),
    path("admin/", admin.site.urls),
] + debug_toolbar_urls()

if settings.DEBUG:
    urlpatterns += [
        path("__reload__/", include("django_browser_reload.urls")),
    ]