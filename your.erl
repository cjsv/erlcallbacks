%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your).

-export([start/0, stop/0]). % suggested api
% add your client api functions

%%% your api

-spec start() -> ok | {error, Reason :: term()}.
start() ->
    %% add applications you depend on
    %ensure_started(crypto),
    application:start(?MODULE).

-spec stop() -> ok | {error, Reason :: term()}.
stop() ->
    application:stop(?MODULE).

% add your client api functions

%%% helper function

ensure_started(App) ->
    case application:start(App) of
        ok ->
	    ok;
	{error, {already_started, App}} ->
            ok
    end.

%%% functions internal to your implementation
