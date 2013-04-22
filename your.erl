%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your).

-export([start/0, stop/0]). % suggested api
% add your client api functions

%%% your api

%% invoked by you
%%
%% @doc Start the applications your application depends on, then start
%% yours. See also your_app:start/0.
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
%% @doc Stop your application.
%%
%% The standard OTP application shutdown mechanisms are invoked.
%%
-spec stop() -> ok | {error, Reason :: term()}.
stop() ->
    application:stop(?MODULE).

% add your client api functions

%%% helper function

%% invoked by
%% your:start/0
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

%%% functions internal to your implementation
