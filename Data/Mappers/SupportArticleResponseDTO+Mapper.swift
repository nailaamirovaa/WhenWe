//
//  SupportArticleResponseDTO+Mapper.swift
//  WhenWe
//
//  Created by Naila Amirova on 06.08.26.
//

extension SupportArticleResponseDTO {

    func toEntity() throws -> SupportArticle {

        guard let id = id else {
            throw MappingError.missingField("id")
        }

        guard let title = title else {
            throw MappingError.missingField("title")
        }

        guard let summary = summary else {
            throw MappingError.missingField("summary")
        }

        guard let tags = tags else {
            throw MappingError.missingField("tags")
        }

        guard let url = url else {
            throw MappingError.missingField("url")
        }

        return SupportArticle(id: id,
                              title: title,
                              summary: summary,
                              tags: tags,
                              url: url)
    }
}
