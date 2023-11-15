<?php

use Slim\Routing\RouteCollectorProxy;
use Slim\Exception\HttpNotFoundException;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

$app->addErrorMiddleware(false, false, false)->setDefaultErrorHandler(function ($request, $exception, $displayErrorDetails, $logErrors, $logErrorDetails) use ($app) {
    $response = $app->getResponseFactory()->createResponse();
    $response = $response->withStatus(404);
    $response->getBody()->write('Página não encontrada');
    return $response;
});