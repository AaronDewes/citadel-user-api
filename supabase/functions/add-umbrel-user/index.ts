import { serve } from "https://deno.land/std@0.131.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@^2.0.0'

const supabase = createClient(
  Deno.env.get('SUPABASE_URL') ?? '',
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
)

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok')
  }

  const { error } = await supabase.from("umbrel_users").insert({});

  if (error) {
  	console.error(error);
  }

  return new Response(
    JSON.stringify({
    	success: true,
    }),
    { headers: { "Content-Type": "application/json" } },
  )
});
