<?php

declare(strict_types=1);

namespace Drupal\webpage\Hook;

use Drupal\Core\Hook\Attribute\Hook;
use Drupal\node\NodeInterface;

/**
 * Fills the summary of Webpage from the body when it is left empty.
 */
class WebpageBodyHooks {

  /**
   * The bundles with their own body and summary fields.
   */
  private const BUNDLES = ['webpage'];

  /**
   * Implements hook_ENTITY_TYPE_presave() for node entities.
   *
   * Teasers and lists show the summary. When the editor leaves it empty, the
   * first paragraph of the body is used, as plain text of up to 200
   * characters.
   */
  #[Hook('node_presave')]
  public function nodePresave(NodeInterface $node): void {
    $applies = \in_array($node->bundle(), self::BUNDLES, TRUE)
      && $node->hasField('field_summary')
      && $node->hasField('field_body');
    if (!$applies || trim((string) $node->get('field_summary')->value) !== '') {
      return;
    }
    $summary = self::summary((string) $node->get('field_body')->value);
    if ($summary !== '') {
      $node->set('field_summary', $summary);
    }
  }

  /**
   * Builds a plain text summary from the first paragraph of a body.
   *
   * @param string $body
   *   The body HTML.
   *
   * @return string
   *   Up to 200 characters, cut at a word boundary.
   */
  public static function summary(string $body): string {
    $text = $body;
    if (preg_match('#<p[^>]*>(.*?)</p>#is', $body, $match)) {
      $text = $match[1];
    }
    $text = trim((string) preg_replace('/\s+/u', ' ', html_entity_decode(strip_tags($text), ENT_QUOTES | ENT_HTML5)));
    if (mb_strlen($text) > 200) {
      $text = mb_substr($text, 0, 200);
      $space = mb_strrpos($text, ' ');
      $text = rtrim(mb_substr($text, 0, $space ?: 200), ' ,.;:') . '…';
    }
    return $text;
  }

}
