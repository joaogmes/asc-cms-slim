<?php

use Slim\Routing\RouteCollectorProxy;
use Slim\Exception\HttpNotFoundException;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

$app->addErrorMiddleware(false, false, false)->setDefaultErrorHandler(function ($request, $exception, $displayErrorDetails, $logErrors, $logErrorDetails) use ($app) {
    $response = $app->getResponseFactory()->createResponse();

    $statusCode = 400;

    if ($exception instanceof HttpNotFoundException) {
        $statusCode = 404;
        $message = 'Página não encontrada';
    } else {
        $statusCode = 500;
        $message = 'Erro interno do servidor';
    }

    if (APP_ENV == 'local') {
        $message .= ': ' . $exception->getMessage();
    }

    $response->getBody()->write(json_encode(["error" => $message]));

    return $response
        ->withHeader('Content-Type', 'application/json')
        ->withStatus($statusCode);
});
