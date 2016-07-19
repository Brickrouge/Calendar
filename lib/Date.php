<?php

/*
 * This file is part of the Brickrouge package.
 *
 * (c) Olivier Laviale <olivier.laviale@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Brickrouge;

/**
 * @deprecated
 */
class Date extends Text
{
	public function __construct(array $attributes = [])
	{
		parent::__construct($attributes + [

			'size' => 16,
			'class' => 'date'

		]);
	}

	public function __toString()
	{
		$value = (string) $this['value'];

		if (!(int) $value)
		{
			$this['value'] = null;
		}

		return parent::__toString();
	}
}
