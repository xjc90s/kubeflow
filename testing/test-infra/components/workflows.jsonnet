local params = std.extVar("__ksonnet/params").components["workflows"];

local k = import 'k.libsonnet';
local workflows = import 'workflows.libsonnet';
local namespace = params.namespace;

// TODO(jlewi): Can we make name default so some random unique value?
// I didn't see any routines in the standard library for datetime or random.
local name = params.name;
local pr = params.pr;
local ref = if pr == "" then ""
            else "pull/" + pr + "/head:pr";
local commit = params.commit;

std.prune(k.core.v1.list.new([workflows.parts(namespace, name).e2e(ref, commit),]))