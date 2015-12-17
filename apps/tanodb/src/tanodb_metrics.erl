-module(tanodb_metrics).
-export([all/0, init/0]).

-export([core_ping/0]).

-define(METRIC_CORE_PING, [tanodb, core, ping]).

all() ->
 [{tanodb, tanodb_stats()},
  {core, core_stats()}].

core_stats() -> [{ping, unwrap_metric_value(?METRIC_CORE_PING)}].

core_ping() -> exometer:update(?METRIC_CORE_PING, 1).

init() ->
    exometer:new(?METRIC_CORE_PING, spiral, [{time_span, 60000}]).

tanodb_stats() ->
    Stats = riak_core_stat:get_stats(),
    lists:map(fun metric_key_to_string/1, Stats).
