{inputs, ...}: {
  flake.nixosModules.slop = {pkgs, ...}: {
    networking.extraHosts = ''
      127.0.0.1 chatgpt.com
      127.0.0.1 www.chatgpt.com
      127.0.0.1 openai.com
      127.0.0.1 www.openai.com
      127.0.0.1 api.openai.com
      127.0.0.1 chat.openai.com
      127.0.0.1 platform.openai.com

      127.0.0.1 gemini.google.com
      127.0.0.1 bard.google.com
      127.0.0.1 ai.google.com
      127.0.0.1 makersuite.google.com

      127.0.0.1 anthropic.com
      127.0.0.1 www.anthropic.com
      127.0.0.1 claude.ai
      127.0.0.1 www.claude.ai
      127.0.0.1 api.anthropic.com

      127.0.0.1 perplexity.ai
      127.0.0.1 www.perplexity.ai
      127.0.0.1 labs.perplexity.ai
      127.0.0.1 api.perplexity.ai

      127.0.0.1 meta.ai
      127.0.0.1 www.meta.ai
      127.0.0.1 ai.facebook.com

      127.0.0.1 mistral.ai
      127.0.0.1 www.mistral.ai
      127.0.0.1 api.mistral.ai

      127.0.0.1 x.ai
      127.0.0.1 www.x.ai
      127.0.0.1 grok.x.ai
      127.0.0.1 api.x.ai

      127.0.0.1 cohere.com
      127.0.0.1 www.cohere.com
      127.0.0.1 api.cohere.ai

      127.0.0.1 cloud.ibm.com
      127.0.0.1 watson.ibm.com
    '';
  };
}
