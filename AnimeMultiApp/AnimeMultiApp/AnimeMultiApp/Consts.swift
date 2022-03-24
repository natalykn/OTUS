//
//  CommonLets.swift
//  AnimeApp
//
//  Created by Natalia Andryushina on 2022-03-01.
//

import Foundation
import ImageIO

let widthForCategoriesScreen: CGFloat = 400

let heightForCategoriesScreen: CGFloat = 500

let aboutText: String =
    """
    Описание/Пошаговая инструкция выполнения домашнего задания:\n\n\
    1. Сделать приложение(или ваше проектное или предыдущих занятий)\
    работающее на watchOS, iOS, tvOS\n\n\
    2. На каждом экране показывать как минимум заголовок и \
    тестовые данные (+ можно картинку)\n\n\
    3. Использовать общую бизнес-логиуку Shared и загрузку данных\
    с публичного апи https://github.com/public-apis/public-apis\n\n
    """

#if os(tvOS)
let widthImage: CGFloat = 400
#else
let widthImage: CGFloat = 50
#endif
