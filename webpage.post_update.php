<?php

/**
 * @file
 * Post update functions for Web Page.
 */

declare(strict_types=1);

/**
 * Start the headings of the contact webform at h2, under the h1 of the page.
 *
 * The default recipe gave the contact webform an h3, "We'd love to talk to
 * you", right after the h1 of the page. A contact webform that still starts
 * with that heading gets it as an h2.
 */
function webpage_post_update_contact_webform_heading(): void {
  $entity_type_manager = \Drupal::entityTypeManager();
  if (!$entity_type_manager->hasDefinition('webform')) {
    return;
  }
  /** @var \Drupal\webform\WebformInterface|null $webform */
  $webform = $entity_type_manager->getStorage('webform')->load('contact');
  if (!$webform) {
    return;
  }
  $elements = $webform->getElementsDecoded();
  $markup = $elements['contact_paragraph']['#markup'] ?? NULL;
  $heading = "<h3>We'd love to talk to you</h3>";
  if (!\is_string($markup) || !\str_starts_with($markup, $heading)) {
    return;
  }
  $elements['contact_paragraph']['#markup'] = "<h2>We'd love to talk to you</h2>" . \substr($markup, \strlen($heading));
  $webform->setElements($elements)->save();
}
