%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(yourapp).

-export([start/0, stop/0]). % suggested api
% add yourapp client api functions

%%% yourapp api

%% invoked by you
%%
%% @doc Start the applications yourapp depends on, then start yourapp.
%% See also yourapp_app:start/0.
%%
%% The standard OTP application startup mechanisms are invoked.
%%
-spec start() ->
                   ok |
                   {error, Reason :: term()}.
start() ->
    %% add applications you depend on
    %ensure_started(crypto),
    application:start(?MODULE).

%% invoked by you
%%
%% @doc Stop yourapp application.
%%
%% The standard OTP application shutdown mechanisms are invoked.
%%
-spec stop() -> ok | {error, Reason :: term()}.
stop() ->
    application:stop(?MODULE).

% add yourapp client api functions

%%% helper function

%% invoked by
%% yourapp:start/0
%%
%% @doc Ensures that an application depended on by your application is started.
%%
-spec ensure_started(App:: atom()) -> ok.
ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.

%%% functions internal to yourapp implementation
