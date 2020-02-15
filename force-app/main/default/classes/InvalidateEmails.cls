global class InvalidateEmails implements SandboxPostCopy {
 global void runApexClass(SandboxContext context) {
  System.debug(context.organizationId());
  System.debug(context.sandboxId());
  System.debug(context.sandboxName());

 // run();
 }
}