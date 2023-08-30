//
//  FirstTableViewCell.swift
//  TercerIntento
//
//  Created by Marco Alba on 8/28/23.
//

import UIKit
import SDWebImage

class FirstTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    var uiImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Nintendo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    var uiText1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Holi :)"
        return label
    } ()
    var uiText2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Holi :)"
        return label
    } ()
    let _switch : UISwitch = {
        let uiSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        return uiSwitch
    } ()
    #warning("There is an error for reused cells and background color, fix in the future")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(uiImageView)
        contentView.addSubview(uiText1)
        contentView.addSubview(uiText2)
        contentView.addSubview(_switch)
        contentView.backgroundColor = .orange
        _switch.addTarget(
            self,
            action: #selector(onSwitchValueChanged),
            for: .valueChanged
        )
        setConstraintsImageView()
        setConstraintsLabel()
        setConstraintsSwitchView()
    }
    
    func setImageAndLabel(pokemonManager: PokemonManager, pokemonUrl: String, labelText: String) {
        uiImageView.image = UIImage(named: "Nintendo")
        uiText1.text = labelText
        pokemonManager.fetchPokemonByUrl(pokemonUrl: pokemonUrl){ pokemonData in
            DispatchQueue.main.async {
                self.uiImageView.sd_setImage(
                    with: URL(string: pokemonData.sprites?.front_default ?? ""),
                    placeholderImage: UIImage(named: "Nintendo")
                )
                self.uiText2.text = "\(pokemonData.id!)"
            }
        }
    }
    
    func setConstraintsImageView() {
        NSLayoutConstraint.activate([
            uiImageView.heightAnchor.constraint(equalToConstant: 100),
            uiImageView.widthAnchor.constraint(equalToConstant: 100),
            uiImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            uiImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }
    
    func setConstraintsLabel() {
        NSLayoutConstraint.activate([
            uiText1.topAnchor.constraint(equalTo: contentView.topAnchor),
            uiText1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            uiText2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            uiText2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
    }
    
    func setConstraintsSwitchView() {
        NSLayoutConstraint.activate([
            _switch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            _switch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50)
        ])
    }
    
    @objc func onSwitchValueChanged() {
        if (_switch.isOn == true){
            print("UISwitch state is now ON")
            contentView.backgroundColor = .systemRed
        }
        else{
            print("UISwitch state is now Off")
            contentView.backgroundColor = .systemGreen
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
